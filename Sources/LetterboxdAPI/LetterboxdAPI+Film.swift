//
//  LetterboxdAPI+Film.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public extension LetterboxdAPI {
  /// A cursored window over the list of films.
  func getFilms(parameters: [String: String] = [:]) async throws -> FilmResponse {
    let accessToken = try await AccessTokenManager.shared.getToken()
    let request = Path("/films")
      .appendParams(parameters)
      .generateRequest(withMethod: .get, accessToken: accessToken)

    return try await processRequest(request: request)
  }

  /// Get details about a film by ID.
  func getFilm(withId id: String) async throws -> Film {
    let accessToken = try await AccessTokenManager.shared.getToken()
    let request = Path("/film/\(id)")
      .generateRequest(withMethod: .get, accessToken: accessToken)

    return try await processRequest(request: request)
  }

  /// Get availability data for a film by ID. Only available to first-party API clients.
  func getFilmAvailability(withId id: String) async throws -> FilmAvailabilityResponse {
    let accessToken = try await AccessTokenManager.shared.getToken()
    let request = Path("/film/\(id)/availability")
      .generateRequest(withMethod: .get, accessToken: accessToken)

    return try await processRequest(request: request)
  }

  /// Get statistical data about a film by ID.
  func getFilmStatistics(withId id: String) async throws -> FilmStatistics {
    let accessToken = try await AccessTokenManager.shared.getToken()
    let request = Path("/film/\(id)/statistics")
      .generateRequest(withMethod: .get, accessToken: accessToken)

    return try await processRequest(request: request)
  }

  /// Get a list of countries supported by the /films endpoint
  func getCountries() async throws -> CountryResponse {
    let accessToken = try await AccessTokenManager.shared.getToken()
    let request = Path("/films/countries")
      .generateRequest(withMethod: .get, accessToken: accessToken)

    return try await processRequest(request: request)
  }

  /// Get a list of services supported by the /films endpoint.
  func getFilmServices() async throws -> FilmServicesResponse {
    let accessToken = try await AccessTokenManager.shared.getToken()
    let request = Path("/films/film-services")
      .generateRequest(withMethod: .get, accessToken: accessToken)

    return try await processRequest(request: request)
  }

  /// Get a list of genres supported by the /films endpoint.
  func getFilmGenres() async throws -> GenresResponse {
    let accessToken = try await AccessTokenManager.shared.getToken()
    let request = Path("/films/genres")
      .generateRequest(withMethod: .get, accessToken: accessToken)

    return try await processRequest(request: request)
  }

  /// Get a list of languages supported by the /films endpoint
  func getFilmLanguages() async throws -> LanguagesResponse {
    let accessToken = try await AccessTokenManager.shared.getToken()
    let request = Path("/films/languages")
      .generateRequest(withMethod: .get, accessToken: accessToken)

    return try await processRequest(request: request)
  }
}
