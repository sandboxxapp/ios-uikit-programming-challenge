//
//  TableViewCell.swift
//  swapi-uikit
//
//  Created by Hino Banzon on 2/4/22.
//

import UIKit

class TableViewCell: UITableViewCell {
  @IBOutlet weak var transportTypeIcon: UIImageView!
  @IBOutlet weak var transportName: UILabel!
  @IBOutlet weak var transportModel: UILabel!
  @IBOutlet weak var cargoCapacity: UILabel!
  
  func set(vehicle: VehicleJson) {
    transportTypeIcon.image = UIImage.vehicle
    transportName.text = vehicle.name
    transportModel.text = vehicle.model
    cargoCapacity.text = vehicle.cargoCapacity
  }
}
