//
//  Member.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct Member: Decodable, Sendable, Hashable {
  public let id: String
  public let username: String
  public let givenName: String?
  public let familyName: String?
  public let displayName: String?
  public let shortName: String?
  public let avatar: Image?

  /// Can be one of `Crew`, `Alum`, `Hq`, `Patron`, `Pro`, `Member`
  public let memberStatus: String
  public let hideAdsInContent: Bool
  public let favoriteFilms: [FilmSummary]?
  public let backdrop: Image?
}
