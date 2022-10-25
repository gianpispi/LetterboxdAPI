//
//  URLBuilder.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import CryptoKit
import Foundation

public class URLBuilder {
    private var scheme: String {
        return "https"
    }

    private var host: String {
        return "api.letterboxd.com"
    }

    private lazy var baseURL: URL? = {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = "/api/v0"
        return components.url
    }()

    private static let shared = URLBuilder()

    private init() {}

    public static func url(path: String, body: Data?, method: HTTPMethod = .get, params: [String: String] = [:]) -> URL {
        guard let url = URL(string: path, relativeTo: shared.baseURL) else {
            fatalError("Unable to create a URL with \(path)")
        }

        return buildURL(url: url, body: body, method: method.rawValue, params: params)
    }

    private static func buildURL(url: URL, body: Data?, method: String, params: [String: String]) -> URL {
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            fatalError("Invalid url, unable to build components path")
        }

        guard !Private.publicAPIKey.isEmpty, !Private.privateAPIKey.isEmpty else {
            fatalError("Please insert API Keys via LetterboxdAPI.setUpAPIKeys(publicAPI: String, privateAPI: String) before calling the API")
        }

        var parameters = params
        parameters["apikey"] = Private.publicAPIKey
        parameters["nonce"] = UUID().uuidString
        parameters["timestamp"] = "\(Int(Date().timeIntervalSince1970))"

        if !parameters.isEmpty {
            components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }

        guard let result = components.url else {
            fatalError("Unable to create url from components (\(components)")
        }

        guard let signature = sign(method: method, url: result.absoluteString, body: body) else {
            fatalError("Unable to create the signature")
        }

        components.queryItems?.append(URLQueryItem(name: "signature", value: signature))
        guard let resultURL = components.url else {
            fatalError("Unable to create url from components after signature")
        }

        return resultURL
    }

    private static func sign(method: String, url: String, body: Data?) -> String? {
        guard let methodData = method.data(using: .utf8), let urlData = url.data(using: .utf8) else { return nil }

        var data: Data = methodData
        data.append(0)
        data.append(urlData)
        data.append(0)
        if let body = body {
            data.append(body)
        }

        guard let privateKeyData = Private.privateAPIKey.data(using: .utf8) else {
            fatalError("No API private key")
        }

        let key = SymmetricKey(data: privateKeyData)
        let authenticationCode = HMAC<SHA256>.authenticationCode(for: data, using: key)
        return authenticationCode.compactMap { String(format: "%02x", $0) }.joined()
    }
}
