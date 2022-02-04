//
//  APIManager.swift
//  swapi-uikit
//
//  Created by Hino Banzon on 2/4/22.
//

import Foundation

protocol APIManager {
  /// Load vehicles from API
  func loadVehicles(success: @escaping (VehicleListResult) -> Void,
                    failure: @escaping NetworkErrorCallback)
}
