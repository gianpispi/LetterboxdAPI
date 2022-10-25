//
//  NewsItem.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct NewsItem: Decodable {
    /// The title of the news item.
    public var title: String

    /// The image.
    public var image: Image

    /// The URL of the news item.
    public var url: String

    /// A short description of the news item in LBML. May contain the following HTML tags: <br> <strong> <em> <b> <i> <a href=""> <blockquote>.
    public var shortDescription: String

    /// A long description of the news item in LBML. May contain the following HTML tags: <br> <strong> <em> <b> <i> <a href=""> <blockquote>.
    public var longDescription: String
    
    /// The podcast episode number, if this news item is for a podcast
    public var episode: Int?
    
    /// The podcast season number, if this news item is for a podcast
    public var season: Int?
}
