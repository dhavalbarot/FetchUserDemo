//
//  ContentView.swift
//  featchUser
//
//  Created by Dhaval Barot on 02/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      UsersListView(viewModel: UserListViewModel())
    }
}

#Preview {
    ContentView()
}
