//
//  Service.swift
//
//
//  Created by Gianpiero Spinelli on 01/10/21.
//

import Foundation

public struct Service: Decodable, Sendable, Hashable {
  /// The LID of the service.
  public var id: String

  /// The name of the service.
  public var name: String

  /// The URL of the thumbnail image for the service.
  public let iconURL: URL?

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case iconURL = "icon"
  }
}
