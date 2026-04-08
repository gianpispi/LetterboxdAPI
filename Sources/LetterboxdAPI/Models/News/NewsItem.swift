//
//  NewsItem.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct NewsItem: Decodable, Sendable, Hashable {
  /// The title of the news item.
  public let title: String

  /// The image.
  public let image: Image?

  /// The URL of the news item.
  public let url: URL

  /// A short description of the news item in LBML. May contain the following HTML tags: <br> <strong> <em> <b> <i> <a href=""> <blockquote>.
  public let shortDescription: String?

  /// A long description of the news item in LBML. May contain the following HTML tags: <br> <strong> <em> <b> <i> <a href=""> <blockquote>.
  public let longDescription: String?

  /// The podcast episode number, if this news item is for a podcast
  public let episode: Int?

  /// The podcast season number, if this news item is for a podcast
  public let season: Int?
}
