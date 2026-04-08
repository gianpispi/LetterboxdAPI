//
//  FilmContributions.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct FilmContributions: Decodable, Sendable, Hashable {
  public let type: String

  /// The list of contributors of the specified type for the film.
  public let contributors: [ContributorSummary]
}
