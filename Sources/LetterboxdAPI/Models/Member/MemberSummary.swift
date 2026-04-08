//
//  MemberSummary.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct MemberSummary: Decodable, Sendable, Hashable {
  public let id: String
  public let username: String
  public let displayName: String
  public let shortName: String
  public let avatar: Image?

  /// Can be one of `Crew`, `Alum`, `Hq`, `Patron`, `Pro`, `Member`
  public let memberStatus: String
}
