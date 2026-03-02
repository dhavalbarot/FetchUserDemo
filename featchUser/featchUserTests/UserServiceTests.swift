//
//  UserServiceTests.swift
//  featchUser
//
//  Created by Dhaval Barot on 02/03/26.
//

import XCTest
@testable import featchUser

class UserServiceTests: XCTestCase {
  
  var sut: UserService! // System Under Test
  var mockManager: MockNetworkManager!

  override func setUp() {
      super.setUp()
      mockManager = MockNetworkManager()
      sut = UserService(networkManager: mockManager)
  }

  override func tearDown() {
      sut = nil
      mockManager = nil
      super.tearDown()
  }

  func testFetchUsers_WhenSuccessful_ReturnsUsers() async throws {
      let expectedUser = User(id: 1, name: "DhavalBarot", username: "dmb", email: "dmb@gmail.com")
      mockManager.mockUsers = [expectedUser]

      let users = try await sut.fetchUsers()
      let firstUserName: String? = await MainActor.run { users.first?.name }

      XCTAssertEqual(users.count, 1, "Should have returned one user")
      XCTAssertEqual(firstUserName, "DhavalBarot")
  }

  func testFetchUsers_WhenNetworkFails_ThrowsError() async {
      mockManager.shouldFail = true

      do {
          _ = try await sut.fetchUsers()
          XCTFail("The request should have thrown an error but succeeded instead.")
      } catch {
          XCTAssertNotNil(error, "An error should have been caught")
      }
  }

}
