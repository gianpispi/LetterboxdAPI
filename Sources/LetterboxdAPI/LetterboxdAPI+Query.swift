import Foundation

public extension LetterboxdAPI {
  /// Executes a typed request against an arbitrary Letterboxd endpoint.
  /// - Parameters:
  ///   - path: The endpoint path relative to the API base URL, for example `film/some-id`.
  ///   - method: The HTTP method.
  ///   - query: Query parameters for the request.
  ///   - body: Optional request body.
  ///   - headers: Additional request headers.
  ///   - requiresAuthorization: Whether the endpoint requires authentication.
  /// - Returns: The decoded response body.
  func query<Response: Decodable>(
    path: String,
    method: HTTPMethod = .get,
    query: [String: String] = [:],
    body: Data? = nil,
    headers: [String: String] = [:],
    requiresAuthorization: Bool = true,
    as responseType: Response.Type = Response.self
  ) async throws -> Response {
    try await request(
      path: path,
      method: method,
      query: query,
      body: body,
      headers: headers,
      requiresAuthorization: requiresAuthorization,
      as: responseType
    )
  }

  /// Executes a typed request using a UTF-8 string request body.
  func query<Response: Decodable>(
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
      body: body,
      headers: headers,
      requiresAuthorization: requiresAuthorization,
      as: responseType
    )
  }

  @available(*, deprecated, message: "Use query(path:method:query:body:headers:requiresAuthorization:as:) instead.")
  func query<Response: Decodable>(path: String, parameters: [String: String], body: String? = nil) async throws -> Response {
    if let body {
      return try await query(path: path, query: parameters, body: body)
    }

    return try await query(path: path, query: parameters, as: Response.self)
  }

  @available(*, deprecated, message: "Use query(path:method:query:body:headers:requiresAuthorization:as:) instead.")
  func query<Response: Decodable>(path: String, parameters: [String: String], body: Data? = nil) async throws -> Response {
    try await query(path: path, query: parameters, body: body, as: Response.self)
  }
}
