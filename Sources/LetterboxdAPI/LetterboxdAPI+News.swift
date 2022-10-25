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
    func getNews(perPage: Int? = nil, completion: @escaping (Result<News, Error>) -> Void) {
        var params: [String: String] = [:]
        if let perPage = perPage {
            params["perPage"] = "\(perPage)"
        }
        
        let url = URLBuilder.url(path: "/news", body: nil, params: params)

        guard let request = generateRequest(url: url, method: .get) else {
            completion(.failure(LetterboxdAPIError.generatingRequest))
            return
        }

        processRequest(request: request, completion: completion)
    }

    /// Get recent news from the Letterboxd editors.
    /// `perPage` default is 20, max is 100.
    func getNews(perPage: Int? = nil) async throws -> News {
        return try await withCheckedThrowingContinuation { continuation in
            getNews(perPage: perPage) { result in
                continuation.resume(with: result)
            }
        }
    }
}
