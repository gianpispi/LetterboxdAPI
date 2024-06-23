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

  public static func setup(publicAPI key: String, privateAPI privateKey: String) async {
    Private.publicAPIKey = key
    Private.privateAPIKey = privateKey

    do {
      _ = try await AccessTokenManager.shared.getToken()
    } catch {
      print("Failed to fetch token: \(error)")
    }
  }

  public func getLID(for url: URL) async throws -> LetterboxdObject {
    let request = url.generateRequest(withMethod: .head)

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

  func processRequest<R: Decodable>(request: URLRequest) async throws -> R {
    let data = try await processRequest(request: request)
    return try JSONDecoder().decode(R.self, from: data) as R
  }

  func processRequest(request: URLRequest) async throws -> Data {
    let (data, _) = try await URLSession.shared.data(for: request)
    return data
  }
}
