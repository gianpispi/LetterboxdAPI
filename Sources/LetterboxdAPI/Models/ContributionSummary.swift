//
//  ContributionSummary.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct ContributorSummary: Decodable, Sendable, Hashable {
  public let id: String
  public let name: String
  public let characterName: String?
  public let tmdbID: String?
  public let customPoster: Image?

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case characterName
    case tmdbID = "tmdbid"
    case customPoster
  }
}
