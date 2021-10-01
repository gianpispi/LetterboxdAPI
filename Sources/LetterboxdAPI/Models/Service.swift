//
//  File.swift
//  
//
//  Created by Gianpiero Spinelli on 01/10/21.
//

import Foundation

public struct Service: Decodable {
    /// The LID of the service.
    public var id: String
    
    /// The name of the service.
    public var name: String
    
    /// The URL of the thumbnail image for the service.
    public var icon: String
}
