//
//  UserItemView.swift
//  fetchUser
//
//  Created by Dhaval Barot on 02/03/26.
//


import SwiftUI

public struct UserItemView: View {
  
  var user: UserListItemViewModel!
  
  public var body: some View {
    VStack(alignment: .leading, spacing: 5){
      Text(user.name)
      Text(user.email)
    }
    .padding()
  }
}

#Preview {
    ContentView()
}
