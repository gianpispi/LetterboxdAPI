//
//  AccessTokenManager.swift
//
//
//  Created by Gianpiero Spinelli on 21/06/24.
//

import Foundation

actor AccessTokenManager {
  private let credentials: LetterboxdAPICredentials
  private let session: URLSession
  private var cachedToken: AccessToken?
  private var inFlightRefreshTask: Task<AccessToken, Error>?

  init(credentials: LetterboxdAPICredentials, session: URLSession) {
    self.credentials = credentials
    self.session = session
  }

  func validToken() async throws -> AccessToken {
    if let cachedToken, cachedToken.isValid() {
      return cachedToken
    }

    if let inFlightRefreshTask {
      return try await inFlightRefreshTask.value
    }

    let refreshTask = Task { [credentials, session] in
      try await Self.fetchToken(credentials: credentials, session: session)
    }

    inFlightRefreshTask = refreshTask

    do {
      let token = try await refreshTask.value
      cachedToken = token
      inFlightRefreshTask = nil
      return token
    } catch {
      inFlightRefreshTask = nil
      throw error
    }
  }

  private static func fetchToken(
    credentials: LetterboxdAPICredentials,
    session: URLSession
  ) async throws -> AccessToken {
    var components = URLComponents()
    components.queryItems = [
      URLQueryItem(name: "grant_type", value: "client_credentials"),
      URLQueryItem(name: "client_id", value: credentials.clientID),
      URLQueryItem(name: "client_secret", value: credentials.clientSecret),
    ]

    let formBody = components.percentEncodedQuery?.data(using: String.Encoding.utf8)

    var request = try APIRequest(
      path: "auth/token",
      method: .post,
      headers: [
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      ],
      body: formBody
    )
      .urlRequest(baseURL: LetterboxdAPI.baseURL)

    request.setValue("application/json", forHTTPHeaderField: "Accept")

    let (data, response) = try await session.data(for: request)
    try LetterboxdAPI.validate(response: response, data: data)

    do {
      return try JSONDecoder().decode(AccessToken.self, from: data)
    } catch {
      throw LetterboxdAPIError.decodingFailed(error)
    }
  }
}
