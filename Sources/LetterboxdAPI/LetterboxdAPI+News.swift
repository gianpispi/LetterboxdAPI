//
//  LetterboxdAPI+News.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public extension LetterboxdAPI {
  /// Get recent news from the Letterboxd editors.
  /// `perPage` default is 20, max is 100.
  func getNews(perPage: Int? = nil) async throws -> News {
    var parameters: [String: String] = [:]
    if let perPage = perPage {
      parameters["perPage"] = "\(perPage)"
    }

    let request = Path("/news")
      .appendParams(parameters)
      .generateRequest(withMethod: .get)

    return try await processRequest(request: request)
  }
}
