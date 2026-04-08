//
//  LetterboxdObject.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public typealias LID = String
public typealias LetterboxdType = LetterboxdObject.LetterboxdType

public struct LetterboxdObject: Codable, Sendable, Hashable {
  public enum LetterboxdType: String, Codable, Sendable, Hashable {
    case film = "Film"
    case logEntry = "LogEntry"
    case member = "Member"
    case story = "Story"
    case list = "List"
    case comment = "Comment"
    case contributor = "Contributor"
  }

  public let type: LetterboxdType
  public let lid: LID
}
