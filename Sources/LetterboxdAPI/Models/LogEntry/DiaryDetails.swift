//
//  DiaryDetails.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli on 19/04/2026.
//

import Foundation

/// Details about a diary entry.
public struct DiaryDetails: Decodable, Sendable, Hashable {
  /// The date the film was watched, in ISO 8601 `YYYY-MM-DD` format.
  public let diaryDate: String

  /// `true` if the member has seen the film prior to this date.
  public let rewatch: Bool
}
