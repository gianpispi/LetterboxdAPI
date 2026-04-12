import Foundation

/// Errors thrown by ``LetterboxdAPI``.
public enum LetterboxdAPIError: Error, Sendable {
  /// The underlying transport request failed.
  case transportFailed(Error)

  /// The request could not be built.
  case invalidRequest(String)

  /// The client base URL is invalid.
  case invalidBaseURL(URL)

  /// The response was not an HTTP response.
  case invalidResponse

  /// The server returned a non-success HTTP status code.
  case unsuccessfulStatusCode(Int, Data)

  /// The response body could not be decoded.
  case decodingFailed(Error)

  /// Credentials are required for this endpoint.
  case missingCredentials

  /// A response header was missing or invalid.
  case missingHeader(String)
}
