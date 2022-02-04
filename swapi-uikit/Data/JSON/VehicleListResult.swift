//
//  VehicleListResult.swift
//  swapi-uikit
//
//  Created by Hino Banzon on 2/4/22.
//

import Foundation

struct VehicleListResult: Codable {
  let count: Int
  let next: String?
  let previous: String?
  let results: [VehicleJson]
}
