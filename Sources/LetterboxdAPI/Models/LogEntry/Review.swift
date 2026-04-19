//
//  Review.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli on 19/04/2026.
//

import Foundation

public struct Review: Decodable, Sendable, Hashable {
  /// The review text in LBML.
  public let lbml: String

  /// For moderated reviews, the original review text in LBML.
  public let originalLbml: String?

  /// `true` if the review contains plot spoilers.
  public let containsSpoilers: Bool

  /// `true` if the spoilers flag has been locked by a moderator.
  public let spoilersLocked: Bool

  /// `true` if the review has been removed by a moderator.
  public let moderated: Bool

  /// The timestamp when the review was first published, in ISO 8601 UTC format.
  public let whenReviewed: String

  /// The review text formatted as HTML.
  public let text: String
}
