//
//  FilmAvailabilityResponse.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct FilmAvailabilityResponse: Decodable, Sendable, Hashable {
  public let items: [FilmAvailability]
}
