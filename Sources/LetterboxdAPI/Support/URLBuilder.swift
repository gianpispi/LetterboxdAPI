//
//  URLBuilder.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

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

  public static func url(path: String, params: [String: String] = [:]) -> URL {
    guard let url = shared.baseURL?.appendingPathComponent(path) else {
      fatalError("Unable to create a URL with \(path)")
    }

    return buildURL(url: url, params: params)
  }

  private static func buildURL(url: URL, params: [String: String]) -> URL {
    guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
      fatalError("Invalid url, unable to build components path")
    }

    if !params.isEmpty {
      components.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
    }

    guard let result = components.url else {
      fatalError("Unable to create url from components (\(components)")
    }

    return result
  }
}
