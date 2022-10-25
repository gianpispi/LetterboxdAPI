//
//  LetterboxdAPI+Film.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public extension LetterboxdAPI {
    /// A cursored window over the list of films.
    func getFilms(parameters: [String: String] = [:], completion: @escaping (Result<FilmResponse, Error>) -> Void) {
        let url = URLBuilder.url(path: "/films", body: nil, params: parameters)
        
        guard let request = generateRequest(url: url, method: .get) else {
            completion(.failure(LetterboxdAPIError.generatingRequest))
            return
        }
        
        processRequest(request: request, completion: completion)
    }
    
    /// A cursored window over the list of films.
    func getFilms(parameters: [String: String] = [:]) async throws -> FilmResponse {
        return try await withCheckedThrowingContinuation { continuation in
            getFilms(parameters: parameters) { result in
                continuation.resume(with: result)
            }
        }
    }
    
    /// Get details about a film by ID.
    func getFilm(withId id: String, completion: @escaping (Result<Film, Error>) -> Void) {
        let url = URLBuilder.url(path: "/film/\(id)", body: nil)
        
        guard let request = generateRequest(url: url, method: .get) else {
            completion(.failure(LetterboxdAPIError.generatingRequest))
            return
        }
        
        processRequest(request: request, completion: completion)
    }
    
    /// Get details about a film by ID.
    func getFilm(withId id: String) async throws -> Film {
        return try await withCheckedThrowingContinuation { continuation in
            getFilm(withId: id) { result in
                continuation.resume(with: result)
            }
        }
    }
    
    /// Get availability data for a film by ID. Only available to first-party API clients.
    func getFilmAvailability(withId id: String, completion: @escaping (Result<FilmAvailabilityResponse, Error>) -> Void) {
        let url = URLBuilder.url(path: "/film/\(id)/availability", body: nil)
        
        guard let request = generateRequest(url: url, method: .get) else {
            completion(.failure(LetterboxdAPIError.generatingRequest))
            return
        }
        
        processRequest(request: request, completion: completion)
    }
    
    /// Get availability data for a film by ID. Only available to first-party API clients.
    func getFilmAvailability(withId id: String) async throws -> FilmAvailabilityResponse {
        return try await withCheckedThrowingContinuation { continuation in
            getFilmAvailability(withId: id) { result in
                continuation.resume(with: result)
            }
        }
    }
    
    /// Get statistical data about a film by ID.
    func getFilmStatistics(withId id: String, completion: @escaping (Result<FilmStatistics, Error>) -> Void) {
        let url = URLBuilder.url(path: "/film/\(id)/statistics", body: nil)
        
        guard let request = generateRequest(url: url, method: .get) else {
            completion(.failure(LetterboxdAPIError.generatingRequest))
            return
        }
        
        processRequest(request: request, completion: completion)
    }
    
    /// Get statistical data about a film by ID.
    func getFilmStatistics(withId id: String) async throws -> FilmStatistics {
        return try await withCheckedThrowingContinuation { continuation in
            getFilmStatistics(withId: id) { result in
                continuation.resume(with: result)
            }
        }
    }
    
    /// Get a list of countries supported by the /films endpoint
    func getCountries(completion: @escaping (Result<CountryResponse, Error>) -> Void) {
        let url = URLBuilder.url(path: "/films/countries", body: nil)
        
        guard let request = generateRequest(url: url, method: .get) else {
            completion(.failure(LetterboxdAPIError.generatingRequest))
            return
        }
        
        processRequest(request: request, completion: completion)
    }
    
    /// Get a list of countries supported by the /films endpoint
    func getCountries() async throws -> CountryResponse {
        return try await withCheckedThrowingContinuation { continuation in
            getCountries { result in
                continuation.resume(with: result)
            }
        }
    }
    
    /// Get a list of services supported by the /films endpoint.
    func getFilmServices(completion: @escaping (Result<FilmServicesResponse, Error>) -> Void) {
        let url = URLBuilder.url(path: "/films/film-services", body: nil)
        
        guard let request = generateRequest(url: url, method: .get) else {
            completion(.failure(LetterboxdAPIError.generatingRequest))
            return
        }
        
        processRequest(request: request, completion: completion)
    }
    
    /// Get a list of services supported by the /films endpoint.
    func getFilmServices() async throws -> FilmServicesResponse {
        return try await withCheckedThrowingContinuation { continuation in
            getFilmServices { result in
                continuation.resume(with: result)
            }
        }
    }
    
    /// Get a list of genres supported by the /films endpoint.
    func getFilmGenres(completion: @escaping (Result<GenresResponse, Error>) -> Void) {
        let url = URLBuilder.url(path: "/films/genres", body: nil)
        
        guard let request = generateRequest(url: url, method: .get) else {
            completion(.failure(LetterboxdAPIError.generatingRequest))
            return
        }
        
        processRequest(request: request, completion: completion)
    }
    
    /// Get a list of genres supported by the /films endpoint.
    func getFilmGenres() async throws -> GenresResponse {
        return try await withCheckedThrowingContinuation { continuation in
            getFilmGenres { result in
                continuation.resume(with: result)
            }
        }
    }
    
    /// Get a list of languages supported by the /films endpoint
    func getFilmLanguages(completion: @escaping (Result<LanguagesResponse, Error>) -> Void) {
        let url = URLBuilder.url(path: "/films/languages", body: nil)
        
        guard let request = generateRequest(url: url, method: .get) else {
            completion(.failure(LetterboxdAPIError.generatingRequest))
            return
        }
        
        processRequest(request: request, completion: completion)
    }
    
    /// Get a list of languages supported by the /films endpoint
    func getFilmLanguages() async throws -> LanguagesResponse {
        return try await withCheckedThrowingContinuation { continuation in
            getFilmLanguages { result in
                continuation.resume(with: result)
            }
        }
    }
}
