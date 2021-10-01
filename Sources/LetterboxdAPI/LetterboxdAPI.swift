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
        
        let task = URLSession.shared.dataTask(with: request) { _, response, error in
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
    
    internal func generateRequest(url: URL, method: HTTPMethod) -> URLRequest? {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    @discardableResult
    internal func processRequest<R: Decodable>(request: URLRequest, completion: @escaping (Result<R, Error>) -> Void) -> URLSessionTask {
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil, let data = data else {
                completion(.failure(error!))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(R.self, from: data) as R
                completion(.success(result))
            } catch {
                print(error)
                completion(.failure(error))
            }
        }
        task.resume()
        return task
    }
}
