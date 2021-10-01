//
//  MemberStatistics.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public typealias MemberIdentifier = FilmIdentifier

public struct MemberStatistics: Decodable {
    public var member: MemberIdentifier
    public var counts: MemberStatisticsCounts
    public var yearsInReview: [Int]?
}

public struct MemberStatisticsCounts: Decodable {
    public var watches: Int
    public var filmsInDiaryThisYear: Int
}
