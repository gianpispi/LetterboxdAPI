//
//  LetterboxdStory.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct LetterboxdStory: Decodable, Sendable, Hashable {
  public let id: String
  public let name: String
  public let author: MemberSummary
  public let url: URL?
  public let source: String?
  public let videoURL: URL?
  public let bodyHTML: String?
  public let bodyLBML: String?
  public let whenUpdated: String
  public let whenCreated: String?
  public let image: Image?
  public let pinned: Bool

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case author
    case url
    case source
    case videoURL = "videoUrl"
    case bodyHTML = "bodyHtml"
    case bodyLBML = "bodyLbml"
    case whenUpdated
    case whenCreated
    case image
    case pinned
  }
}
