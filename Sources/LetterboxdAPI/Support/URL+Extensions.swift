//
//  URL+Extensions.swift
//
//
//  Created by Gianpiero Spinelli on 19/06/24.
//

import Foundation

extension URL {
  func generateRequest(withMethod method: HTTPMethod) -> URLRequest {
    var request = URLRequest(url: self)
    request.httpMethod = method.rawValue
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    return request
  }
}
