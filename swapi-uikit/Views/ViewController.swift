//
//  ViewController.swift
//  swapi-uikit
//
//  Created by Hino Banzon on 2/4/22.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  private let apiManager: APIManager = SwapiAPIManager()
  
  private var data: VehicleListResult?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loadData()
  }
  
  private func loadData() {
    apiManager.loadVehicles(success: { [weak self] result in
      self?.data = result
      self?.tableView.reloadData()
    }, failure: { errorMessage in
      print(errorMessage)
    })
  }
}


// MARK: UITableViewDataSource

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data?.results.count ?? 0
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell,
          let vehicle = data?.results[indexPath.row] else {
      return UITableViewCell()
    }
    
    cell.set(vehicle: vehicle)
    return cell
  }
}
