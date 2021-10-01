//
//  FilmContributions.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct FilmContributions: Decodable {
    public var type: String
    
    /// The list of contributors of the specified type for the film.
    public var contributors: [ContributorSummary]
}
