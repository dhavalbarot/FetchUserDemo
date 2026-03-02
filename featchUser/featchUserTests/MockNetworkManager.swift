//
//  MockNetworkManager.swift
//  featchUser
//
//  Created by Dhaval Barot on 02/03/26.
//

import Foundation
import Testing
@testable import featchUser

// Now the mock doesn't need to inherit from the real class at all
final class MockNetworkManager: NetworkManaging {
    var mockUsers: [User] = []
    var shouldFail: Bool = false
  
    func request<T: Decodable>(url: String) async throws -> T {
      if shouldFail {
        throw URLError(.badServerResponse)
      }
      return mockUsers as! T
    }
}
