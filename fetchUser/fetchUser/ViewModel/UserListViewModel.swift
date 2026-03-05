//
//  UserListViewModel.swift
//  fetchUser
//
//  Created by Dhaval Barot on 02/03/26.
//

import Foundation
internal import Combine

class UserListViewModel: ObservableObject {
  @Published var users: [UserListItemViewModel] = []
  
  private let service: UserServiceType
  
  init(service: UserServiceType = UserService()) {
    self.service = service
  }
  
  
  func loadUserList() async {
    do {
      let userData = try await service.fetchUsers()
      self.users = userData.map({ UserListItemViewModel(id: $0.id,
                                                     name: $0.name,
                                                     email: $0.email)})
    } catch(let error) {
      print(error)
    }
  }
}
