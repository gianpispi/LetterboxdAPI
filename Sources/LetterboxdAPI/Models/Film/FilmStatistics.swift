//
//  FilmStatistics.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct FilmStatistics: Decodable, Sendable, Hashable {
  public let film: FilmIdentifier

  /// The weighted average rating of the film between 0.5 and 5.0. Will not be present if the film has not received sufficient ratings.
  public let rating: Float?

  /// The number of watches, ratings, likes, etc. for the film.
  public let counts: FilmStatisticsCounts
}
