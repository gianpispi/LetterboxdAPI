//
//  FilmResponse.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct FilmResponse: Decodable {
    var next: String?
    var items: [FilmSummary]
}
