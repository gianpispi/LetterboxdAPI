//
//  Link.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct Link: Decodable, Sendable, Hashable {
  public enum LinkType: String, Decodable, Sendable, Hashable {
    case letterboxd
    case boxd
    case tmdb
    case imdb
    case justwatch
    case facebook
    case instagram
    case twitter
    case youtube
    case tickets
    case tiktok
  }

  public let type: LinkType
  public let id: String
  public let url: URL
  public let label: String?
}
