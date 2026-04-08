//
//  Country.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct Country: Decodable, Sendable, Hashable {
  /// The ISO 3166-1 defined code of the country.
  public var code: String

  /// The name of the country.
  public var name: String

  public let flagURL: URL?

  enum CodingKeys: String, CodingKey {
    case code
    case name
    case flagURL = "flagUrl"
  }
}
