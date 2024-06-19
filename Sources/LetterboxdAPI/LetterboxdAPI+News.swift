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
    var params: [String: String] = [:]
    if let perPage = perPage {
      params["perPage"] = "\(perPage)"
    }

    let url = URLBuilder.url(path: "/news", body: nil, params: params)
    let request = generateRequest(url: url, method: .get)

    return try await processRequest(request: request)
  }
}
