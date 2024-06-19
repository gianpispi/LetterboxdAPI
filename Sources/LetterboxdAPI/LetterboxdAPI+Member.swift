//
//  LetterboxdAPI+Member.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public extension LetterboxdAPI {
  func getMember(withID id: String) async throws -> Member {
    let request = Path("/member/\(id)")
      .url()
      .generateRequest(withMethod: .get)

    return try await processRequest(request: request)
  }

  func getMemberStatistics(withID id: String) async throws -> MemberStatistics {
    let request = Path("/member/\(id)/statistics")
      .url()
      .generateRequest(withMethod: .get)

    return try await processRequest(request: request)
  }

  /// Get details of a member’s public watchlist by ID.
  func getMemberWatchlist(withID id: String, parameters: [String: String] = [:]) async throws -> FilmResponse {
    let request = Path("/member/\(id)/watchlist")
      .appendParams(parameters)
      .url()
      .generateRequest(withMethod: .get)

    return try await processRequest(request: request)
  }
}
