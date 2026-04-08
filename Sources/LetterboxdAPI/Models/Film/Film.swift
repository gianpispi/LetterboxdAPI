//
//  Film.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct Film: Decodable, Sendable, Hashable {
  public let id: String
  public let name: String
  public let originalName: String?

  /// The other names by which the film is known (including alternative titles and/or foreign translations).
  public let alternativeNames: [String]?
  public let releaseYear: Int?
  public let poster: Image?
  public let adultPoster: Image?

  /// The film’s position in the official Letterboxd Top 250 list of narrative feature films, `nil` if the film is not in the list.
  public let top250Position: Int?

  /// `true` if the film is in TMDb’s ‘Adult’ category.
  public let adult: Bool

  /// The LID of the collection containing this film.
  public let filmCollectionID: String?

  /// A list of relevant URLs for this entity, on Letterboxd and external sites.
  public let links: [Link]

  /// The tagline for the film.
  public let tagline: String?

  /// A synopsis of the film.
  public let description: String?

  /// The film’s duration (in minutes).
  public let runTime: Int?

  /// The film’s backdrop image (16:9 ratio in multiple sizes).
  public let backdrop: Image?

  /// The backdrop’s vertical focal point, expressed as a proportion of the image’s height, using values between 0.0 and 1.0. Use when cropping the image into a shorter space, such as in the page for a film on the Letterboxd site.
  public let backdropFocalPoint: Float?

  /// The film’s trailer.
  public let trailer: FilmTrailer?
  public let countries: [Country]?
  public let languages: [Language]?
  public let contributions: [FilmContributions]
  public let news: [NewsItem]?
  public let recentStories: [LetterboxdStory]?

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case originalName
    case alternativeNames
    case releaseYear
    case poster
    case adultPoster
    case top250Position
    case adult
    case filmCollectionID = "filmCollectionId"
    case links
    case tagline
    case description
    case runTime
    case backdrop
    case backdropFocalPoint
    case trailer
    case countries
    case languages
    case contributions
    case news
    case recentStories
  }
}
