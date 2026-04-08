//
//  MemberStatistics.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public typealias MemberIdentifier = FilmIdentifier

public struct MemberStatistics: Decodable, Sendable, Hashable {
  public let member: MemberIdentifier
  public let counts: MemberStatisticsCounts
  public let yearsInReview: [Int]?
}

public struct MemberStatisticsCounts: Decodable, Sendable, Hashable {
  public let filmLikes: Int
  public let listLikes: Int
  public let reviewLikes: Int
  public let storyLikes: Int
  public let watches: Int
  public let ratings: Int
  public let reviews: Int
  public let diaryEntries: Int
  public let diaryEntriesThisYear: Int
  public let filmsInDiaryThisYear: Int
  public let filmsInDiaryLastYear: Int
  public let watchlist: Int
  public let lists: Int
  public let unpublishedLists: Int?
  public let accessedSharedLists: Int?
  public let followers: Int
  public let following: Int
  public let listTags: Int
  public let filmTags: Int
}
