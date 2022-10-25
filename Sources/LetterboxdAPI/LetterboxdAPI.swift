//
//  LetterbodxAPI.swift
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
    }

    public static let shared = LetterboxdAPI()

    private init() {}

    public static func setUpAPIKeys(publicAPI key: String, privateAPI privateKey: String) {
        Private.publicAPIKey = key
        Private.privateAPIKey = privateKey
    }

    public func getLID(for url: URL, completion: @escaping (Result<LetterboxdObject, Error>) -> Void) {
        guard let request = generateRequest(url: url, method: .head) else {
            completion(.failure(LetterboxdAPIError.generatingRequest))
            return
        }

        let task = URLSession.shared.dataTask(with: request) { _, response, _ in
            guard let response = response as? HTTPURLResponse,
                  let id = response.allHeaderFields["x-letterboxd-identifier"] as? String,
                  let typeString = response.allHeaderFields["x-letterboxd-type"] as? String,
                  let type = LetterboxdType(rawValue: typeString)
            else {
                completion(.failure(LetterboxdAPIError.wrongResponse))
                return
            }

            completion(.success(LetterboxdObject(type: type, lid: id)))
        }
        task.resume()
    }

    public func getLID(for url: URL) async throws -> LetterboxdObject {
        return try await withCheckedThrowingContinuation { continuation in
            getLID(for: url) { result in
                continuation.resume(with: result)
            }
        }
    }

    internal func generateRequest(url: URL, method: HTTPMethod) -> URLRequest? {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }

    @discardableResult
    internal func processRequest<R: Decodable>(request: URLRequest, completion: @escaping (Result<R, Error>) -> Void) -> URLSessionTask {
        processRequest(request: request) { result in
            switch result {
            case let .success(data):
                do {
                    let obj = try JSONDecoder().decode(R.self, from: data) as R
                    completion(.success(obj))
                } catch {
                    print(error)
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    @discardableResult
    internal func processRequest(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) -> URLSessionTask {
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard error == nil, let data = data else {
                completion(.failure(error!))
                return
            }

            completion(.success(data))
        }
        task.resume()
        return task
    }
}
