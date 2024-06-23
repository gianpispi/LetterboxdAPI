//
//  AccessTokenManager.swift
//
//
//  Created by Gianpiero Spinelli on 21/06/24.
//

import Foundation

class AccessTokenManager: NSObject {
  static let shared = AccessTokenManager()
  private var accessToken: AccessToken?

  override private init() {}

  private func fetchToken() async throws {
    let body = "grant_type=client_credentials&client_id=\(Private.publicAPIKey)&client_secret=\(Private.privateAPIKey)".data(using: .utf8)

    let request = Path("/auth/token")
      .appendHeaders(["Content-Type": "application/x-www-form-urlencoded", "Accept": "application/json"])
      .appendBody(body)
      .generateRequest(withMethod: .post)

    let (data, _) = try await URLSession.shared.data(for: request)
    let tokenObject = try JSONDecoder().decode(AccessToken.self, from: data)
    accessToken = tokenObject
  }

  func getToken() async throws -> AccessToken {
    if let accessToken, accessToken.expiresAt < Date() {
      return accessToken
    }
    try await fetchToken()
    guard let accessToken else {
      throw URLError(.badServerResponse)
    }
    return accessToken
  }
}
