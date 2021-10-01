//
//  Language.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct Language: Decodable {
    /// The ISO 639-1 defined code of the language.
    public var code: String

    /// The name of the language.
    public var name: String
}
