//
//  FilmTrailer.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct FilmTrailer: Decodable {
    /// The YouTube ID of the trailer.
    public var id: String

    /// The YouTube URL for the trailer.
    public var url: String
}
