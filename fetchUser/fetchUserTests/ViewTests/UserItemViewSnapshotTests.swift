//
//  Untitled.swift
//  fetchUser
//
//  Created by Dhaval Barot on 06/03/26.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import fetchUser

@MainActor
final class UserItemViewSnapshotTests: XCTestCase {
  
  func testUserItemViewSnapshot() {
    let contentView = UserItemView(user: MockUserListItemViewModel.user1)
    let hostingController = UIHostingController(rootView: contentView)
    assertSnapshot(
      of: hostingController,
      as: .image(on: .iPhone13(.portrait))
    )
  }
}

