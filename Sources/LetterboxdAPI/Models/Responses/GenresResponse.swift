//
//  GenresResponse.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct GenresResponse: Decodable, Sendable, Hashable {
  public let items: [Genre]
}
