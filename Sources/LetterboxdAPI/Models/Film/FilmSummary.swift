//
//  FilmsSummary.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct FilmSummary: Decodable {
  public var id: String
  public var name: String
  public var sortingName: String
  public var originalName: String?
  public var releaseYear: Int?
  public var rating: Float?
  public var adult: Bool
  public var directors: [ContributorSummary]?
  public var poster: Image?
  public var adultPoster: Image?

  public var links: [Link]
}
