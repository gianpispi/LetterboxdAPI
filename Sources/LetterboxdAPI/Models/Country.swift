//
//  Country.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct Country: Decodable {
    /// The ISO 3166-1 defined code of the country.
    public var code: String

    /// The name of the country.
    public var name: String
}
