//
//  VehicleJson.swift
//  swapi-uikit
//
//  Created by Hino Banzon on 2/4/22.
//

import Foundation

struct VehicleJson: Codable {
  let name: String
  let model: String
  let url: String
  let cargoCapacity: String
  
  private enum CodingKeys: String, CodingKey {
    case name
    case model
    case url
    case cargoCapacity = "cargo_capacity"
  }
}
