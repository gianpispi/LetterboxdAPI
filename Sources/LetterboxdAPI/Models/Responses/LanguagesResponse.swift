//
//  LanguagesResponse.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct LanguagesResponse: Decodable, Sendable, Hashable {
  public let items: [Language]
}
