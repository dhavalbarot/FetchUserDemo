//
//  MockNetworkManager.swift
//  fetchUser
//
//  Created by Dhaval Barot on 02/03/26.
//

import Foundation
import Testing
@testable import fetchUser

final class MockNetworkManager: NetworkManaging {
    var mockUsers: [User] = []
    var shouldFail: Bool = false

    func request<T: Decodable>(endpoint: EndPoint) async throws -> T {
        if shouldFail {
            throw NSError(domain: "Mock", code: 1)
        }
        if T.self == [User].self, let users = mockUsers as? T {
            return users
        }
        throw NSError(domain: "Mock", code: 2)
    }
}
