//
//  FilmsResponse.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct FilmsResponse: Decodable, Sendable, Hashable {
  public let next: String?
  public let items: [FilmSummary]
}
