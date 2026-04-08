//
//  FilmTrailer.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct FilmTrailer: Decodable, Sendable, Hashable {
  /// The YouTube ID of the trailer.
  public let id: String

  /// The YouTube URL for the trailer.
  public let url: URL
}
