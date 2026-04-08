import Foundation
import Testing
@testable import LetterboxdAPI

@Suite(.serialized)
struct LetterboxdAPITests {
  @Test
  func requestBuildsAuthorizationAndQueryItems() async throws {
    let recorder = RequestRecorder()
    let session = makeSession()
    let client = LetterboxdAPI(
      credentials: .init(clientID: "public", clientSecret: "secret"),
      session: session
    )

    MockURLProtocol.setHandler { request in
      recorder.record(request)

      switch request.url?.path {
      case "/api/v0/auth/token":
        return (.json(statusCode: 200, url: request.url!), Data(#"{"access_token":"token","token_type":"Bearer","expires_in":3600}"#.utf8))
      case "/api/v0/films":
        return (.json(statusCode: 200, url: request.url!), Data(#"{"items":[],"next":"cursor"}"#.utf8))
      default:
        throw URLError(.badURL)
      }
    }

    let response = try await client.films(matching: ["perPage": "10", "sort": "Name"])
    #expect(response.next == "cursor")

    let requests = recorder.snapshot()
    #expect(requests.count == 2)

    let filmsRequest = try #require(requests.last)
    #expect(filmsRequest.value(forHTTPHeaderField: "Authorization") == "Bearer token")
    #expect(filmsRequest.url?.query == "perPage=10&sort=Name")
  }

  @Test
  func concurrentRequestsShareOneTokenRefresh() async throws {
    let session = makeSession()
    let counter = Counter()
    let client = LetterboxdAPI(
      credentials: .init(clientID: "public", clientSecret: "secret"),
      session: session
    )

    MockURLProtocol.setHandler { request in
      switch request.url?.path {
      case "/api/v0/auth/token":
        counter.increment()
        return (.json(statusCode: 200, url: request.url!), Data(#"{"access_token":"token","token_type":"Bearer","expires_in":3600}"#.utf8))
      case "/api/v0/film/1", "/api/v0/film/2":
        return (.json(statusCode: 200, url: request.url!), Data(#"{"id":"1","name":"Film","adult":false,"links":[],"contributions":[]}"#.utf8))
      default:
        throw URLError(.badURL)
      }
    }

    async let first = client.film(withID: "1")
    async let second = client.film(withID: "2")

    _ = try await (first, second)

    #expect(counter.value == 1)
  }

  @Test
  func unsuccessfulStatusCodeThrowsTypedError() async throws {
    let session = makeSession()
    let client = LetterboxdAPI(
      credentials: .init(clientID: "public", clientSecret: "secret"),
      session: session
    )

    MockURLProtocol.setHandler { request in
      switch request.url?.path {
      case "/api/v0/auth/token":
        return (.json(statusCode: 200, url: request.url!), Data(#"{"access_token":"token","token_type":"Bearer","expires_in":3600}"#.utf8))
      case "/api/v0/film/1":
        return (.json(statusCode: 429, url: request.url!), Data("rate limited".utf8))
      default:
        throw URLError(.badURL)
      }
    }

    do {
      _ = try await client.film(withID: "1")
      Issue.record("Expected the request to throw.")
    } catch let error as LetterboxdAPIError {
      guard case let .unsuccessfulStatusCode(statusCode, body) = error else {
        Issue.record("Expected an unsuccessfulStatusCode error, got \(error).")
        return
      }

      #expect(statusCode == 429)
      #expect(String(decoding: body, as: UTF8.self) == "rate limited")
    }
  }

  @Test
  func resolvingLetterboxdObjectUsesHeadResponseHeaders() async throws {
    let session = makeSession()
    let client = LetterboxdAPI(session: session)

    MockURLProtocol.setHandler { request in
      let response = HTTPURLResponse(
        url: request.url!,
        statusCode: 200,
        httpVersion: nil,
        headerFields: [
          "x-letterboxd-identifier": "abc123",
          "x-letterboxd-type": "Film",
        ]
      )!

      return (response, Data())
    }

    let object = try await client.resolveLetterboxdObject(for: URL(string: "https://letterboxd.com/film/free-guy/")!)
    #expect(object.lid == "abc123")
    #expect(object.type == .film)
  }

  @Test
  func authenticatedEndpointsRequireCredentials() async throws {
    let client = LetterboxdAPI(session: makeSession())

    do {
      _ = try await client.film(withID: "1")
      Issue.record("Expected missing credentials error.")
    } catch let error as LetterboxdAPIError {
      guard case .missingCredentials = error else {
        Issue.record("Expected missingCredentials, got \(error).")
        return
      }
    }
  }
}

private func makeSession() -> URLSession {
  let configuration = URLSessionConfiguration.ephemeral
  configuration.protocolClasses = [MockURLProtocol.self]
  return URLSession(configuration: configuration)
}

private final class RequestRecorder: @unchecked Sendable {
  private let lock = NSLock()
  private var requests: [URLRequest] = []

  func record(_ request: URLRequest) {
    lock.lock()
    defer { lock.unlock() }
    requests.append(request)
  }

  func snapshot() -> [URLRequest] {
    lock.lock()
    defer { lock.unlock() }
    return requests
  }
}

private final class Counter: @unchecked Sendable {
  private let lock = NSLock()
  private var storage = 0

  var value: Int {
    lock.lock()
    defer { lock.unlock() }
    return storage
  }

  func increment() {
    lock.lock()
    defer { lock.unlock() }
    storage += 1
  }
}

private final class MockURLProtocol: URLProtocol {
  private static let storage = HandlerStorage()

  static func setHandler(_ handler: @escaping @Sendable (URLRequest) throws -> (HTTPURLResponse, Data)) {
    storage.setHandler(handler)
  }

  override class func canInit(with request: URLRequest) -> Bool {
    true
  }

  override class func canonicalRequest(for request: URLRequest) -> URLRequest {
    request
  }

  override func startLoading() {
    do {
      let handler = try Self.storage.handler()
      let (response, data) = try handler(request)
      client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
      client?.urlProtocol(self, didLoad: data)
      client?.urlProtocolDidFinishLoading(self)
    } catch {
      client?.urlProtocol(self, didFailWithError: error)
    }
  }

  override func stopLoading() {}
}

private final class HandlerStorage: @unchecked Sendable {
  private let lock = NSLock()
  private var currentHandler: (@Sendable (URLRequest) throws -> (HTTPURLResponse, Data))?

  func setHandler(_ handler: @escaping @Sendable (URLRequest) throws -> (HTTPURLResponse, Data)) {
    lock.lock()
    defer { lock.unlock() }
    currentHandler = handler
  }

  func handler() throws -> @Sendable (URLRequest) throws -> (HTTPURLResponse, Data) {
    lock.lock()
    defer { lock.unlock() }

    guard let currentHandler else {
      throw URLError(.badServerResponse)
    }

    return currentHandler
  }
}

private extension HTTPURLResponse {
  static func json(statusCode: Int, url: URL) -> HTTPURLResponse {
    HTTPURLResponse(
      url: url,
      statusCode: statusCode,
      httpVersion: nil,
      headerFields: ["Content-Type": "application/json"]
    )!
  }
}
