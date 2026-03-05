//
//  UsersList.swift
//  fetchUser
//
//  Created by Dhaval Barot on 02/03/26.
//

import SwiftUI

public struct UsersListView: View {
  
  @ObservedObject var viewModel: UserListViewModel

  init(viewModel: UserListViewModel!) {
    self.viewModel = viewModel
  }
  
  public var body: some View {
    VStack {
      List(viewModel.users) { user in
        UserItemView(user: user)
      }
    }
    .onAppear {
      Task {
        await viewModel.loadUserList()
      }
    }
  }
}

#Preview {
    ContentView()
}
