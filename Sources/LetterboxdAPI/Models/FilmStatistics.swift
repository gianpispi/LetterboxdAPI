//
//  FilmStatistics.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct FilmStatistics: Decodable {
    public var film: FilmIdentifier
    
    /// The weighted average rating of the film between 0.5 and 5.0. Will not be present if the film has not received sufficient ratings.
    public var rating: Float?
    
    /// The number of watches, ratings, likes, etc. for the film.
    public var counts: FilmStatisticsCounts
}
