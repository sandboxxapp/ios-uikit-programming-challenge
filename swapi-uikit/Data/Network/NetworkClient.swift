//
//  NetworkClient.swift
//  swapi-uikit
//
//  Created by Hino Banzon on 2/4/22.
//

import Foundation

class NetworkClient {
  /// Performs a `GET` call over rest.
  /// Callbacks are guaranteed to run on the main thread.
  func get<T: Codable>(url: URL,
                       success: @escaping (T) -> Void,
                       failure: @escaping NetworkErrorCallback) {
    getData(url: url, success: { data in
      let decoder = JSONDecoder()
      guard let object = try? decoder.decode(T.self, from: data) else {
        failure("Could not parse response data")
        return
      }
      
      // parsing completed, return success
      success(object)
    }, failure: failure)
  }
  
  /// Fetch data over network via URLSession.
  /// Callbacks are guaranteed to run on the main thread.
  private func getData(url: URL,
                       success: @escaping (Data) -> Void,
                       failure: @escaping NetworkErrorCallback) {
    let session = URLSession.shared
    
    let failureHandler = { errorMessage in
      DispatchQueue.main.async {
        failure(errorMessage)
      }
    }
    
    let task = session.dataTask(with: url) { data, response, error in
      // When there's an error, treat as failed request
      if let error = error {
        failureHandler(error.localizedDescription)
        return
      }
      
      // Check for successful network response
      guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
        failureHandler("Unsuccessful HTTP response")
        return
      }
      
      // At this point, we should expect data
      guard let data = data else {
        failureHandler("No data returned when data was expected")
        return
      }
      
      // Data fetch from Network task
      DispatchQueue.main.async {
        success(data)
      }
    }
    
    task.resume()
  }
}
