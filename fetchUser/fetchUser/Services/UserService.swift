//
//  UserService.swift
//  fetchUser
//
//  Created by Dhaval Barot on 02/03/26.
//
import Foundation

protocol UserServiceType {
  func fetchUsers() async throws -> [User]
}

final class UserService: UserServiceType {
  
  private let networkManager: NetworkManaging
  
  init(networkManager: NetworkManaging = NetworkManger.shared) {
    self.networkManager = networkManager
  }
  
  func fetchUsers() async throws -> [User] {
    return try await networkManager.request(endpoint: .fetchUsers)
  }
}
