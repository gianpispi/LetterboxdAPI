import Foundation

/// Credentials used to authenticate against the Letterboxd API.
public struct LetterboxdAPICredentials: Sendable, Hashable {
  /// The public client identifier issued by Letterboxd.
  public let clientID: String

  /// The client secret issued by Letterboxd.
  public let clientSecret: String

  /// Creates a new credentials value.
  public init(clientID: String, clientSecret: String) {
    self.clientID = clientID
    self.clientSecret = clientSecret
  }
}
