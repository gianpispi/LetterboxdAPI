//
//  LetterboxdAPI+Member.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public extension LetterboxdAPI {
  func getMember(withID id: String) async throws -> Member {
    let accessToken = try await AccessTokenManager.shared.getToken()
    let request = Path("/member/\(id)")
      .generateRequest(withMethod: .get, accessToken: accessToken)

    return try await processRequest(request: request)
  }

  func getMemberStatistics(withID id: String) async throws -> MemberStatistics {
    let accessToken = try await AccessTokenManager.shared.getToken()
    let request = Path("/member/\(id)/statistics")
      .generateRequest(withMethod: .get, accessToken: accessToken)

    return try await processRequest(request: request)
  }

  /// Get details of a member’s public watchlist by ID.
  func getMemberWatchlist(withID id: String, parameters: [String: String] = [:]) async throws -> FilmResponse {
    let accessToken = try await AccessTokenManager.shared.getToken()
    let request = Path("/member/\(id)/watchlist")
      .appendParams(parameters)
      .generateRequest(withMethod: .get, accessToken: accessToken)

    return try await processRequest(request: request)
  }
}
