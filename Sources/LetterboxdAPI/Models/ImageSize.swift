//
//  ImageSize.swift
//
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct ImageSize: Decodable {
    public var width: Int
    public var height: Int
    public var url: String

    func getURL() -> URL {
        return URL(string: url)!
    }
}
