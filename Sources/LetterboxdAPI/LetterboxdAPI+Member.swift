import Foundation

public extension LetterboxdAPI {
  /// Returns full details for a member.
  func member(withID id: String) async throws -> Member {
    try await request(path: "member/\(id)")
  }

  /// Returns aggregate statistics for a member.
  func memberStatistics(forMemberWithID id: String) async throws -> MemberStatistics {
    try await request(path: "member/\(id)/statistics")
  }

  /// Returns the public watchlist for a member.
  func memberWatchlist(forMemberWithID id: String, query: [String: String] = [:]) async throws -> FilmsResponse {
    try await request(path: "member/\(id)/watchlist", query: query)
  }

  @available(*, deprecated, renamed: "member(withID:)")
  func getMember(withID id: String) async throws -> Member {
    try await member(withID: id)
  }

  @available(*, deprecated, renamed: "memberStatistics(forMemberWithID:)")
  func getMemberStatistics(withID id: String) async throws -> MemberStatistics {
    try await memberStatistics(forMemberWithID: id)
  }

  @available(*, deprecated, renamed: "memberWatchlist(forMemberWithID:query:)")
  func getMemberWatchlist(withID id: String, parameters: [String: String] = [:]) async throws -> FilmsResponse {
    try await memberWatchlist(forMemberWithID: id, query: parameters)
  }
}
