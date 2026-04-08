//
//  FilmSummary.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct FilmSummary: Decodable, Sendable, Hashable {
  public let id: String
  public let name: String
  public let sortingName: String
  public let originalName: String?
  public let releaseYear: Int?
  public let rating: Float?
  public let adult: Bool
  public let directors: [ContributorSummary]?
  public let poster: Image?
  public let adultPoster: Image?
  public let links: [Link]
}
