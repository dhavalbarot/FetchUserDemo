//
//  NetworkManager.swift
//  fetchUser
//
//  Created by Dhaval Barot on 02/03/26.
//

import Foundation

protocol NetworkManaging {
    func request<T: Decodable>(endpoint: EndPoint) async throws -> T
}

class NetworkManger: NetworkManaging {
   
  enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError(Error)
    case unknownError
  }
  
  static let shared = NetworkManger()
  
  private let session: URLSession = URLSession.shared
  
  private init() { }
  
  func request<T>(endpoint: EndPoint) async throws -> T where T : Decodable {
    guard let baseURL = URL(string: EndPoint.baseURL),
            let url = URL(string: endpoint.urlString, relativeTo: baseURL) else {
      throw NetworkError.invalidURL
    }
    
    let request = URLRequest(url: url)
    let (data, response) = try await session.data(for: request)
    
    guard let httpResponse = response as? HTTPURLResponse,
          (200...299).contains(httpResponse.statusCode) else {
      throw NetworkError.invalidResponse
    }
    
    do {
      let decodedData = try JSONDecoder().decode(T.self, from: data)
      return decodedData
    } catch {
      throw NetworkError.decodingError(error)
    }
  }
}

