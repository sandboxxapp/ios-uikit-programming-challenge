//
//  SwapiAPIManager.swift
//  swapi-uikit
//
//  Created by Hino Banzon on 2/4/22.
//

import Foundation

class SwapiAPIManager: APIManager {
  private let networkClient = NetworkClient()
    
  private enum Endpoint {
    private static let baseUrl = "https://swapi.dev/api/"
    static let vehicles = URL(string: "\(baseUrl)/vehicles")
  }
    
  func loadVehicles(success: @escaping (VehicleListResult) -> Void,
                    failure: @escaping NetworkErrorCallback) {
    guard let url = Endpoint.vehicles else {
      failure("Could not generate URL to fetch Vehicles.")
      return
    }
    
    networkClient.get(url: url,
                      success: success,
                      failure: failure)
  }
}
