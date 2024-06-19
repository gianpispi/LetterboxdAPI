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
    let url = URLBuilder.url(path: "/films", body: nil, params: parameters)
    let request = generateRequest(url: url, method: .get)

    return try await processRequest(request: request)
  }

  /// Get details about a film by ID.
  func getFilm(withId id: String) async throws -> Film {
    let url = URLBuilder.url(path: "/film/\(id)", body: nil)
    let request = generateRequest(url: url, method: .get)

    return try await processRequest(request: request)
  }

  /// Get availability data for a film by ID. Only available to first-party API clients.
  func getFilmAvailability(withId id: String) async throws -> FilmAvailabilityResponse {
    let url = URLBuilder.url(path: "/film/\(id)/availability", body: nil)
    let request = generateRequest(url: url, method: .get)

    return try await processRequest(request: request)
  }

  /// Get statistical data about a film by ID.
  func getFilmStatistics(withId id: String) async throws -> FilmStatistics {
    let url = URLBuilder.url(path: "/film/\(id)/statistics", body: nil)
    let request = generateRequest(url: url, method: .get)

    return try await processRequest(request: request)
  }

  /// Get a list of countries supported by the /films endpoint
  func getCountries() async throws -> CountryResponse {
    let url = URLBuilder.url(path: "/films/countries", body: nil)
    let request = generateRequest(url: url, method: .get)

    return try await processRequest(request: request)
  }

  /// Get a list of services supported by the /films endpoint.
  func getFilmServices() async throws -> FilmServicesResponse {
    let url = URLBuilder.url(path: "/films/film-services", body: nil)
    let request = generateRequest(url: url, method: .get)

    return try await processRequest(request: request)
  }

  /// Get a list of genres supported by the /films endpoint.
  func getFilmGenres() async throws -> GenresResponse {
    let url = URLBuilder.url(path: "/films/genres", body: nil)
    let request = generateRequest(url: url, method: .get)

    return try await processRequest(request: request)
  }

  /// Get a list of languages supported by the /films endpoint
  func getFilmLanguages() async throws -> LanguagesResponse {
    let url = URLBuilder.url(path: "/films/languages", body: nil)
    let request = generateRequest(url: url, method: .get)

    return try await processRequest(request: request)
  }
}
