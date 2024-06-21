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
  public var filmLikes: Int
  public var listLikes: Int
  public var reviewLikes: Int
  public var storyLikes: Int
  public var watches: Int
  public var ratings: Int
  public var reviews: Int
  public var diaryEntries: Int
  public var diaryEntriesThisYear: Int
  public var filmsInDiaryThisYear: Int
  public var filmsInDiaryLastYear: Int
  public var watchlist: Int
  public var lists: Int
  public var unpublishedLists: Int?
  public var accessedSharedLists: Int?
  public var followers: Int
  public var following: Int
  public var listTags: Int
  public var filmTags: Int
}
