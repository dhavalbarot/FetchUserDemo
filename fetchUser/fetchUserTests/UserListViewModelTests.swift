//
//  UserListViewModelTests.swift
//  fetchUser
//
//  Created by Dhaval Barot on 05/03/26.
//

import XCTest
@testable import fetchUser

class UserListViewModelTests: XCTestCase {
    
    @MainActor
    func testLoadUserListSuccess() async throws {
        // Arrange
        let mockService = MockUserService()
        mockService.usersToReturn = [User(id: 1, name: "Dhaval", username: "dmb11", email: "dbm@gmail.com"),
                                     User(id: 2, name: "Robert", username: "rob11", email: "robert11@gmail.com")]
        let viewModel = UserListViewModel(service: mockService)
        
        // Act
        await viewModel.loadUserList()
        
        // Assert
        XCTAssertEqual(viewModel.users.count, 2)
        XCTAssertEqual(viewModel.users.first?.name, "Dhaval")
        XCTAssertEqual(viewModel.users.last?.email, "robert11@gmail.com")
    }
    
    @MainActor
    func testLoadUserListFailure() async {
        // Arrange
        let mockService = MockUserService()
        mockService.shouldThrow = true
        let viewModel = UserListViewModel(service: mockService)
        
        // Act
        await viewModel.loadUserList()
        
        // Assert
        XCTAssertEqual(viewModel.users.count, 0)
    }
}

