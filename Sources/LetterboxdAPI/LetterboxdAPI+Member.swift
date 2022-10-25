//
//  LetterboxdAPI+Member.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public extension LetterboxdAPI {
    func getMember(withID id: String, completion: @escaping (Result<Member, Error>) -> Void) {
        let url = URLBuilder.url(path: "/member/\(id)", body: nil)
        
        guard let request = generateRequest(url: url, method: .get) else {
            completion(.failure(LetterboxdAPIError.generatingRequest))
            return
        }
        
        processRequest(request: request, completion: completion)
    }
    
    func getMember(withID id: String) async throws -> Member {
        return try await withCheckedThrowingContinuation { continuation in
            getMember(withID: id) { result in
                continuation.resume(with: result)
            }
        }
    }
    
    func getMemberStatistics(withID id: String, completion: @escaping (Result<MemberStatistics, Error>) -> Void) {
        let url = URLBuilder.url(path: "/member/\(id)/statistics", body: nil)
        
        guard let request = generateRequest(url: url, method: .get) else {
            completion(.failure(LetterboxdAPIError.generatingRequest))
            return
        }
        
        processRequest(request: request, completion: completion)
    }
    
    func getMemberStatistics(withID id: String) async throws -> MemberStatistics {
        return try await withCheckedThrowingContinuation { continuation in
            getMemberStatistics(withID: id) { result in
                continuation.resume(with: result)
            }
        }
    }
    
    /// Get details of a member’s public watchlist by ID.
    func getMemberWatchlist(withID id: String, parameters: [String: String] = [:], completion: @escaping (Result<FilmResponse, Error>) -> Void) {
        let url = URLBuilder.url(path: "/member/\(id)/watchlist", body: nil, params: parameters)
        
        guard let request = generateRequest(url: url, method: .get) else {
            completion(.failure(LetterboxdAPIError.generatingRequest))
            return
        }
        
        processRequest(request: request, completion: completion)
    }
    
    /// Get details of a member’s public watchlist by ID.
    func getMemberWatchlist(withID id: String, parameters: [String: String] = [:]) async throws -> FilmResponse {
        return try await withCheckedThrowingContinuation { continuation in
            getMemberWatchlist(withID: id, parameters: parameters) { result in
                continuation.resume(with: result)
            }
        }
    }
}
