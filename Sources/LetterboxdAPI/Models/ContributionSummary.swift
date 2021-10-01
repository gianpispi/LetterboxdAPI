//
//  ContributorSummary.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct ContributorSummary: Decodable {
    public var id: String
    public var name: String
    public var characterName: String?
    public var tmdbid: String?
}
