//
//  LetterboxdAPI+Query.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public extension LetterboxdAPI {
  /// Generic query for any endpoint on the letterboxd APIs
  /// - Parameters:
  ///   - path: the endpoint, eg: `/film/id`
  ///   - parameters: the parameters for the endpoint
  ///   - body: if the endpoint supports a body, please insert use it here
  ///   - completion: the completion of the request
  func query<D: Decodable>(path: String, parameters: [String: String], body: String? = nil) async throws -> D {
    try await query(path: path, parameters: parameters, body: body?.data(using: .utf8))
  }

  /// Generic query for any endpoint on the letterboxd APIs
  /// - Parameters:
  ///   - path: the endpoint, eg: `/film/id`
  ///   - parameters: the parameters for the endpoint
  ///   - body: if the endpoint supports a body, please insert use it here
  ///   - completion: the completion of the request
  func query<D: Decodable>(path: String, parameters: [String: String], body: Data? = nil) async throws -> D {
    let url = URLBuilder.url(path: path, body: body, params: parameters)
    let request = generateRequest(url: url, method: .get)

    return try await processRequest(request: request)
  }
}
