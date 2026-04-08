//
//  Genre.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct Genre: Decodable, Sendable, Hashable {
  /// The LID of the genre.
  public var id: String

  /// The name of the genre.
  public var name: String
}
