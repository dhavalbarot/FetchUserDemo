//
//  MockUserListItemViewModel.swift
//  fetchUser
//
//  Created by Dhaval Barot on 06/03/26.
//

import Foundation
@testable import fetchUser

struct MockUserListItemViewModel {
    static let user1 = UserListItemViewModel(id: 1, name: "Test User", email: "test@example.com")
    static let user2 = UserListItemViewModel(id: 2, name: "Mock Name", email: "mock@example.com")
    static let userList: [UserListItemViewModel] = [user1, user2]
}

