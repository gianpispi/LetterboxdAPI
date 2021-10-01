//
//  Member.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct Member: Decodable {
    public var id: String
    public var username: String
    public var givenName: String?
    public var familyName: String?
    public var displayName: String?
    public var shortName: String?
    public var avatar: Image?

    /// Can be one of `Crew`, `Alum`, `Hq`, `Patron`, `Pro`, `Member`
    public var memberStatus: String
    public var hideAdsInContent: Bool
    public var favoriteFilms: [Film]?
    public var backdrop: Image?
}
