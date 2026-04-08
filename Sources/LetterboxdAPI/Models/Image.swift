//
//  Image.swift
//
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct Image: Decodable, Sendable, Hashable {
  public let sizes: [ImageSize]
}
