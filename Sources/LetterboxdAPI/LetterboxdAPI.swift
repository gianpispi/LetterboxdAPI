import Foundation

/// An async client for the public Letterboxd API.
public struct LetterboxdAPI: Sendable {
  private let session: URLSession
  private let tokenManager: AccessTokenManager?
  static let baseURL = URL(string: "https://api.letterboxd.com/api/v0")!

  /// Creates a client for the Letterboxd API.
  /// - Parameters:
  ///   - credentials: The credentials used for authenticated endpoints.
   ///   - session: The URL session used to execute requests.
  public init(
    credentials: LetterboxdAPICredentials? = nil,
    session: URLSession = .shared
  ) {
    self.session = session
    tokenManager = credentials.map { AccessTokenManager(credentials: $0, session: session) }
  }

  /// Resolves a Letterboxd URL into its object identifier and type.
  /// - Parameter url: The public Letterboxd URL to inspect.
  /// - Returns: The resolved object metadata.
  public func resolveLetterboxdObject(for url: URL) async throws -> LetterboxdObject {
    var request = URLRequest(url: url)
    request.httpMethod = HTTPMethod.head.rawValue

    let (_, response) = try await session.data(for: request)

    guard let httpResponse = response as? HTTPURLResponse else {
      throw LetterboxdAPIError.invalidResponse
    }

    guard let identifier = httpResponse.value(forHTTPHeaderField: "x-letterboxd-identifier") else {
      throw LetterboxdAPIError.missingHeader("x-letterboxd-identifier")
    }

    guard let typeValue = httpResponse.value(forHTTPHeaderField: "x-letterboxd-type") else {
      throw LetterboxdAPIError.missingHeader("x-letterboxd-type")
    }

    guard let type = LetterboxdObject.LetterboxdType(rawValue: typeValue) else {
      throw LetterboxdAPIError.missingHeader("x-letterboxd-type")
    }

    return LetterboxdObject(type: type, lid: identifier)
  }

  /// Executes a typed request against the Letterboxd API.
  /// - Parameters:
  ///   - path: The endpoint path relative to the API base URL.
  ///   - method: The HTTP method to use.
  ///   - query: Query items to include in the request URL.
  ///   - body: The request body.
  ///   - headers: Additional headers to include.
  ///   - requiresAuthorization: Whether the request needs an access token.
  /// - Returns: The decoded response value.
  public func request<Response: Decodable>(
    path: String,
    method: HTTPMethod = .get,
    query: [String: String] = [:],
    body: Data? = nil,
    headers: [String: String] = [:],
    requiresAuthorization: Bool = true,
    as responseType: Response.Type = Response.self
  ) async throws -> Response {
    let apiRequest = APIRequest(
      path: path,
      method: method,
      query: queryItems(from: query),
      headers: headers,
      body: body
    )

    return try await send(apiRequest, requiresAuthorization: requiresAuthorization, as: responseType)
  }

  /// Executes a typed request with a UTF-8 string request body.
  public func request<Response: Decodable>(
    path: String,
    method: HTTPMethod = .get,
    query: [String: String] = [:],
    body: String,
    headers: [String: String] = [:],
    requiresAuthorization: Bool = true,
    as responseType: Response.Type = Response.self
  ) async throws -> Response {
    try await request(
      path: path,
      method: method,
      query: query,
      body: Data(body.utf8),
      headers: headers,
      requiresAuthorization: requiresAuthorization,
      as: responseType
    )
  }

  static func validate(response: URLResponse, data: Data) throws {
    guard let httpResponse = response as? HTTPURLResponse else {
      throw LetterboxdAPIError.invalidResponse
    }

    guard (200 ..< 300).contains(httpResponse.statusCode) else {
      throw LetterboxdAPIError.unsuccessfulStatusCode(httpResponse.statusCode, data)
    }
  }

  private func authorizationHeaderValue() async throws -> String {
    guard let tokenManager else {
      throw LetterboxdAPIError.missingCredentials
    }

    let token = try await tokenManager.validToken()
    return "\(token.tokenType) \(token.accessToken)"
  }

  private func send<Response: Decodable>(
    _ apiRequest: APIRequest,
    requiresAuthorization: Bool,
    as responseType: Response.Type
  ) async throws -> Response {
    let authorization = requiresAuthorization ? try await authorizationHeaderValue() : nil
    let request = try apiRequest.urlRequest(baseURL: Self.baseURL, authorization: authorization)
    let (data, response) = try await session.data(for: request)

    try Self.validate(response: response, data: data)

    do {
      return try Self.decoder.decode(responseType, from: data)
    } catch {
      throw LetterboxdAPIError.decodingFailed(error)
    }
  }

  private func queryItems(from query: [String: String]) -> [URLQueryItem] {
    query.keys.sorted().map { URLQueryItem(name: $0, value: query[$0]) }
  }

  private static let decoder = JSONDecoder()
}
