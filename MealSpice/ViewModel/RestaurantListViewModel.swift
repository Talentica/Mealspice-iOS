//
//  RestaurantListViewModel.swift
//  MealSpice
//
//  Created by Rohan Ratnaparkhi on 24/07/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import Foundation

struct RestaurantListViewModel {
  
  weak var dataSource : GenericDataSource<Restaurant>?
  weak var service: RestaurantServiceProtocol?
  
  init(service: RestaurantServiceProtocol = Webservice.shared, dataSource : GenericDataSource<Restaurant>?) {
    self.dataSource = dataSource
    self.service = service
  }
  
  func fetchRestaurantList(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
    guard let service = service else {
      completion?(Result.failure(ErrorResult.custom(string: "Missing service")))
      return
    }
    
    service.fetchRestaurantList { result in
      DispatchQueue.main.async {
        switch result {
        case .success(let restaurantList) :
          // reload data
          self.dataSource?.data.value = restaurantList
          completion?(Result.success(true))
          break
        case .failure(let error) :
          print("Parser error \(error)")
          completion?(Result.failure(error))
          break
        }
      }
    }
  }
}






