import Foundation

public extension LetterboxdAPI {
  /// Returns recent editorial news.
  /// - Parameter perPage: The page size. Letterboxd currently documents a default of 20 and a maximum of 100.
  func news(perPage: Int? = nil) async throws -> News {
    var query: [String: String] = [:]
    if let perPage {
      query["perPage"] = String(perPage)
    }

    return try await request(path: "news", query: query)
  }

  @available(*, deprecated, renamed: "news(perPage:)")
  func getNews(perPage: Int? = nil) async throws -> News {
    try await news(perPage: perPage)
  }
}
