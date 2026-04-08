//
//  ImageSize.swift
//
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct ImageSize: Decodable, Sendable, Hashable {
  public let width: Int
  public let height: Int
  public let url: URL
}
