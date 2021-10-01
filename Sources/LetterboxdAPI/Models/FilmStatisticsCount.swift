//
//  FilmStatisticsCounts.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct FilmStatisticsCounts: Decodable {
    public var watches: Int
    public var likes: Int
    public var ratings: Int
    public var fans: Int
    public var lists: Int
    public var reviews: Int
}
