import Foundation

public extension LetterboxdAPI {
  /// Returns full details for a log entry.
  func logEntry(withID id: String) async throws(LetterboxdAPIError) -> LogEntry {
    try await request(path: "log-entry/\(id)")
  }
}
