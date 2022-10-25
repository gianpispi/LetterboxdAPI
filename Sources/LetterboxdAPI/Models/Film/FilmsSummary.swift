//
//  FilmSummary.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct FilmSummary: Decodable {
    public var id: String
    public var name: String
    public var releaseYear: Int?
    public var directors: [ContributorSummary]?
    public var poster: Image
    public var adultPoster: Image?

    public var links: [Link]
}
