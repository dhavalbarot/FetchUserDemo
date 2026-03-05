//
//  Endpoints.swift
//  fetchUser
//
//  Created by Dhaval Barot on 05/03/26.
//

import Foundation

enum EndPoint {
  case fetchUsers
}

extension EndPoint {
  static var baseURL: String { "https://jsonplaceholder.typicode.com" }

  var urlString: String {
    switch self {
    case .fetchUsers:
      return "/users"
    }
  }
}


