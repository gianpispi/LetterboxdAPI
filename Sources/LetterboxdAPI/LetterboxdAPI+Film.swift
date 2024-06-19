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
    let request = Path("/films")
      .appendParams(parameters)
      .url()
      .generateRequest(withMethod: .get)

    return try await processRequest(request: request)
  }

  /// Get details about a film by ID.
  func getFilm(withId id: String) async throws -> Film {
    let request = Path("/film/\(id)")
      .url()
      .generateRequest(withMethod: .get)

    return try await processRequest(request: request)
  }

  /// Get availability data for a film by ID. Only available to first-party API clients.
  func getFilmAvailability(withId id: String) async throws -> FilmAvailabilityResponse {
    let request = Path("/film/\(id)/availability")
      .url()
      .generateRequest(withMethod: .get)

    return try await processRequest(request: request)
  }

  /// Get statistical data about a film by ID.
  func getFilmStatistics(withId id: String) async throws -> FilmStatistics {
    let request = Path("/film/\(id)/statistics")
      .url()
      .generateRequest(withMethod: .get)

    return try await processRequest(request: request)
  }

  /// Get a list of countries supported by the /films endpoint
  func getCountries() async throws -> CountryResponse {
    let request = Path("/films/countries")
      .url()
      .generateRequest(withMethod: .get)

    return try await processRequest(request: request)
  }

  /// Get a list of services supported by the /films endpoint.
  func getFilmServices() async throws -> FilmServicesResponse {
    let request = Path("/films/film-services")
      .url()
      .generateRequest(withMethod: .get)

    return try await processRequest(request: request)
  }

  /// Get a list of genres supported by the /films endpoint.
  func getFilmGenres() async throws -> GenresResponse {
    let request = Path("/films/genres")
      .url()
      .generateRequest(withMethod: .get)

    return try await processRequest(request: request)
  }

  /// Get a list of languages supported by the /films endpoint
  func getFilmLanguages() async throws -> LanguagesResponse {
    let request = Path("/films/languages")
      .url()
      .generateRequest(withMethod: .get)

    return try await processRequest(request: request)
  }
}
