//
//  FilmAvailabilityResponse.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct FilmAvailabilityResponse: Decodable {
    public var items: [FilmAvailability]
}
