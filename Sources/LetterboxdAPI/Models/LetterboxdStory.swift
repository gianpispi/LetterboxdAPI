//
//  LetterboxdStory.swift
//  LetterboxdAPI
//
//  Created by Gianpiero Spinelli.
//

import Foundation

public struct LetterboxdStory: Decodable {
    public var id: String
    public var name: String
    public var author: MemberSummary
    public var url: String
    public var source: String
    public var videoUrl: String
    public var bodyHtml: String
    public var bodyLbml: String
    public var whenUpdated: String
    public var whenCreated: String
    public var image: Image
}
