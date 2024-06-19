//
//  LetterboxdAPI+Member.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public extension LetterboxdAPI {
  func getMember(withID id: String) async throws -> Member {
    let url = URLBuilder.url(path: "/member/\(id)", body: nil)
    let request = generateRequest(url: url, method: .get)

    return try await processRequest(request: request)
  }

  func getMemberStatistics(withID id: String) async throws -> MemberStatistics {
    let url = URLBuilder.url(path: "/member/\(id)/statistics", body: nil)
    let request = generateRequest(url: url, method: .get)

    return try await processRequest(request: request)
  }

  /// Get details of a member’s public watchlist by ID.
  func getMemberWatchlist(withID id: String, parameters: [String: String] = [:]) async throws -> FilmResponse {
    let url = URLBuilder.url(path: "/member/\(id)/watchlist", body: nil, params: parameters)
    let request = generateRequest(url: url, method: .get)

    return try await processRequest(request: request)
  }
}
