//
//  AccessToken.swift
//
//
//  Created by Gianpiero Spinelli on 21/06/24.
//

import Foundation

struct AccessToken: Decodable {
  var accessToken: String
  var tokenType: String
  var expiresAt: Date

  enum CodingKeys: String, CodingKey {
    case accessToken = "access_token"
    case tokenType = "token_type"
    case expiresIn = "expires_in"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    accessToken = try container.decode(String.self, forKey: .accessToken)
    tokenType = try container.decode(String.self, forKey: .tokenType)
    let expiresIn = try container.decode(Int.self, forKey: .expiresIn)

    expiresAt = Date().addingTimeInterval(TimeInterval(expiresIn))
  }
}
