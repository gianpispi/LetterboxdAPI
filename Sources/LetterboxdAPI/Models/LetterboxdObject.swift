//
//  LetterboxdObject.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public typealias LID = String
public typealias LetterboxdType = LetterboxdObject.LetterboxdType

public struct LetterboxdObject: Codable {
    public enum LetterboxdType: String, Codable {
        case film = "Film"
        case logEntry = "LogEntry"
        case member = "Member"
        case story = "Story"
        case list = "List"
        case comment = "Comment"
        case contributor = "Contributor"
    }

    public var type: LetterboxdType
    public var lid: LID
}
