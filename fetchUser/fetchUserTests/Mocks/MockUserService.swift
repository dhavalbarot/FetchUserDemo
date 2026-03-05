//
//  MockUserService.swift
//  fetchUser
//
//  Created by Dhaval Barot on 06/03/26.
//

import XCTest
@testable import fetchUser

class MockUserService: UserServiceType {
    var usersToReturn: [User] = []
    var shouldThrow: Bool = false
    func fetchUsers() async throws -> [User] {
        if shouldThrow {
            throw NSError(domain: "Test", code: 1)
        }
        return usersToReturn
    }
}
