//
//  FilmServicesResponse.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct FilmServicesResponse: Decodable, Sendable, Hashable {
  public let items: [Service]
}
