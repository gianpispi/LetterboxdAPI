//
//  Path.swift
//
//
//  Created by Gianpiero Spinelli on 19/06/24.
//

import Foundation

struct Path {
  var path: String
  var body: Data?
  var parameters: [String: String] = [:]

  init(_ path: String) {
    self.path = path
  }

  func appendBody(_ body: Data?) -> Self {
    var newPath = self
    newPath.body = body
    return newPath
  }

  func appendParams(_ params: [String: String]) -> Self {
    var newPath = self
    newPath.parameters = params
    return newPath
  }

  func url() -> URL {
    URLBuilder.url(path: path, body: body, params: parameters)
  }
}
