//
//  MemberSummary.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct MemberSummary: Decodable {
    public var id: String
    public var username: String
    public var displayName: String?
    public var avatar: Image?

    /// Can be one of `Crew`, `Alum`, `Hq`, `Patron`, `Pro`, `Member`
    public var memberStatus: String
}
