//
//  Tag.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli on 19/04/2026.
//

import Foundation

public struct Tag: Decodable, Sendable, Hashable {
  /// The tag code.
  public let code: String

  /// The tag text as entered by the tagger.
  public let displayTag: String
}
