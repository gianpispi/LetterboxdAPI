import Foundation

public extension LetterboxdAPI {
  /// Returns a paged list of films matching the supplied query parameters.
  func films(matching query: [String: String] = [:]) async throws(LetterboxdAPIError) -> FilmsResponse {
    try await request(path: "films", query: query)
  }

  /// Returns full details for a film.
  func film(withID id: String) async throws(LetterboxdAPIError) -> Film {
    try await request(path: "film/\(id)")
  }

  /// Returns the streaming and purchase availability for a film.
  func filmAvailability(forFilmWithID id: String) async throws(LetterboxdAPIError) -> FilmAvailabilityResponse {
    try await request(path: "film/\(id)/availability")
  }

  /// Returns aggregate statistics for a film.
  func filmStatistics(forFilmWithID id: String) async throws(LetterboxdAPIError) -> FilmStatistics {
    try await request(path: "film/\(id)/statistics")
  }

  /// Returns the countries supported by the films endpoint.
  func countries() async throws(LetterboxdAPIError) -> CountriesResponse {
    try await request(path: "films/countries")
  }

  /// Returns the services supported by the films endpoint.
  func filmServices() async throws(LetterboxdAPIError) -> FilmServicesResponse {
    try await request(path: "films/film-services")
  }

  /// Returns the genres supported by the films endpoint.
  func filmGenres() async throws(LetterboxdAPIError) -> GenresResponse {
    try await request(path: "films/genres")
  }

  /// Returns the languages supported by the films endpoint.
  func filmLanguages() async throws(LetterboxdAPIError) -> LanguagesResponse {
    try await request(path: "films/languages")
  }

  @available(*, deprecated, renamed: "films(matching:)")
  func getFilms(parameters: [String: String] = [:]) async throws(LetterboxdAPIError) -> FilmsResponse {
    try await films(matching: parameters)
  }

  @available(*, deprecated, renamed: "film(withID:)")
  func getFilm(withId id: String) async throws(LetterboxdAPIError) -> Film {
    try await film(withID: id)
  }

  @available(*, deprecated, renamed: "filmAvailability(forFilmWithID:)")
  func getFilmAvailability(withId id: String) async throws(LetterboxdAPIError) -> FilmAvailabilityResponse {
    try await filmAvailability(forFilmWithID: id)
  }

  @available(*, deprecated, renamed: "filmStatistics(forFilmWithID:)")
  func getFilmStatistics(withId id: String) async throws(LetterboxdAPIError) -> FilmStatistics {
    try await filmStatistics(forFilmWithID: id)
  }

  @available(*, deprecated, renamed: "countries()")
  func getCountries() async throws(LetterboxdAPIError) -> CountriesResponse {
    try await countries()
  }

  @available(*, deprecated, renamed: "filmServices()")
  func getFilmServices() async throws(LetterboxdAPIError) -> FilmServicesResponse {
    try await filmServices()
  }

  @available(*, deprecated, renamed: "filmGenres()")
  func getFilmGenres() async throws(LetterboxdAPIError) -> GenresResponse {
    try await filmGenres()
  }

  @available(*, deprecated, renamed: "filmLanguages()")
  func getFilmLanguages() async throws(LetterboxdAPIError) -> LanguagesResponse {
    try await filmLanguages()
  }
}
