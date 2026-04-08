//
//  CountryResponse.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct CountriesResponse: Decodable, Sendable, Hashable {
  public let items: [Country]
}
