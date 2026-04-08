import Foundation

struct APIRequest: Sendable {
  let path: String
  var method: HTTPMethod = .get
  var query: [URLQueryItem] = []
  var headers: [String: String] = [:]
  var body: Data?

  init(
    path: String,
    method: HTTPMethod = .get,
    query: [URLQueryItem] = [],
    headers: [String: String] = [:],
    body: Data? = nil
  ) {
    self.path = path
    self.method = method
    self.query = query
    self.headers = headers
    self.body = body
  }

  func urlRequest(baseURL: URL, authorization: String? = nil) throws -> URLRequest {
    guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false) else {
      throw LetterboxdAPIError.invalidBaseURL(baseURL)
    }

    let normalizedBasePath = components.path.hasSuffix("/") ? String(components.path.dropLast()) : components.path
    let normalizedRequestPath = path.hasPrefix("/") ? String(path.dropFirst()) : path
    components.path = normalizedBasePath + "/" + normalizedRequestPath
    components.queryItems = query.isEmpty ? nil : query

    guard let url = components.url else {
      throw LetterboxdAPIError.invalidRequest(path)
    }

    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue
    request.httpBody = body

    for (header, value) in headers {
      request.setValue(value, forHTTPHeaderField: header)
    }

    if body != nil, headers["Content-Type"] == nil {
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }

    if let authorization {
      request.setValue(authorization, forHTTPHeaderField: "Authorization")
    }

    return request
  }
}
