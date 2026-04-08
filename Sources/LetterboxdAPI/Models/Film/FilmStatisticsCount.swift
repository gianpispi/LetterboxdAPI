//
//  FilmStatisticsCount.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct FilmStatisticsCounts: Decodable, Sendable, Hashable {
  public let watches: Int
  public let likes: Int
  public let ratings: Int
  public let fans: Int
  public let lists: Int
  public let reviews: Int
}
