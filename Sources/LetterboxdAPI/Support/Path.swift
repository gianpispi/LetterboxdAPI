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
  var headers: [String: String] = [:]

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
  
  func appendHeaders(_ headers: [String: String]) -> Self {
    var newPath = self
    newPath.headers = headers
    return newPath
  }
  
  func generateRequest(withMethod method: HTTPMethod) -> URLRequest {
    let url = URLBuilder.url(path: path, params: parameters)
    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    if let body {
      request.httpBody = body
    }
    
    for header in headers {
      request.setValue(header.value, forHTTPHeaderField: header.key)
    }
    
    if let accessToken = AccessTokenManager.shared.accessToken {
      request.setValue("\(accessToken.tokenType) \(accessToken.accessToken)", forHTTPHeaderField: "Authorization")
    }
    
    return request
  }
}
