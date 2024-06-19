//
//  LetterboxdAPI.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public typealias LetterboxdAPIError = LetterboxdAPI.LetterboxdAPIError

public class LetterboxdAPI {
  public enum LetterboxdAPIError: Error {
    case generatingRequest
    case wrongResponse
    case responseError
  }

  public static let shared = LetterboxdAPI()

  private init() {}

  public static func setUpAPIKeys(publicAPI key: String, privateAPI privateKey: String) {
    Private.publicAPIKey = key
    Private.privateAPIKey = privateKey
  }

  public func getLID(for url: URL) async throws -> LetterboxdObject {
    let request = generateRequest(url: url, method: .head)

    let (_, response) = try await URLSession.shared.data(for: request)
    guard let response = response as? HTTPURLResponse,
          let id = response.allHeaderFields["x-letterboxd-identifier"] as? String,
          let typeString = response.allHeaderFields["x-letterboxd-type"] as? String,
          let type = LetterboxdType(rawValue: typeString)
    else {
      throw LetterboxdAPIError.wrongResponse
    }

    return LetterboxdObject(type: type, lid: id)
  }

  func generateRequest(url: URL, method: HTTPMethod) -> URLRequest {
    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    return request
  }

  func processRequest<R: Decodable>(request: URLRequest) async throws -> R {
    let data = try await processRequest(request: request)
    return try JSONDecoder().decode(R.self, from: data) as R
  }

  func processRequest(request: URLRequest) async throws -> Data {
    let (data, _) = try await URLSession.shared.data(for: request)
    return data
  }
}
