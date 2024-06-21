//
//  Link.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct Link: Decodable {
  public enum LinkType: String, Decodable {
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

  public var type: LinkType
  public var id: String
  public var url: String
  public var label: String?
}
