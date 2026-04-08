//
//  News.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct News: Decodable, Sendable, Hashable {
  public let items: [NewsItem]
}
