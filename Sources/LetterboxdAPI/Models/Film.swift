//
//  Film.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct Film: Decodable {
    public var id: String
    public var name: String
    public var originalName: String

    /// The other names by which the film is known (including alternative titles and/or foreign translations).
    public var alternativeNames: [String]
    public var releaseYear: Int
    public var directors: [ContributorSummary]
    public var poster: Image
    public var adultPoster: Image

    /// The film’s position in the official Letterboxd Top 250 list of narrative feature films, `nil` if the film is not in the list.
    public var top250Position: Int?

    /// `true` if the film is in TMDb’s ‘Adult’ category.
    public var adult: Bool

    /// The LID of the collection containing this film.
    public var filmCollectionId: String

    /// A list of relevant URLs for this entity, on Letterboxd and external sites.
    public var links: [Link]

    /// The tagline for the film.
    public var tagline: String

    /// A synopsis of the film.
    public var description: String

    /// The film’s duration (in minutes).
    public var runTime: Int

    /// The film’s backdrop image (16:9 ratio in multiple sizes).
    public var backdrop: Image

    /// The backdrop’s vertical focal point, expressed as a proportion of the image’s height, using values between 0.0 and 1.0. Use when cropping the image into a shorter space, such as in the page for a film on the Letterboxd site.
    public var backdropFocalPoint: Float

    /// The film’s trailer.
    public var trailer: FilmTrailer

    /// The film’s genres.
    public var genres: [Genre]
    public var countries: [Country]
    public var languages: [Language]
    public var contributions: [FilmContributions]
    public var news: [NewsItem]
    public var recentStories: [LetterboxdStory]
}
