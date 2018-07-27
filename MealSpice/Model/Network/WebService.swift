//
//  WebService.swift
//  MealSpice
//
//  Created by Rohan Ratnaparkhi on 09/06/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol RestaurantServiceProtocol : class {
  func fetchRestaurantList(_ completion: @escaping ((Result<[Restaurant], ErrorResult>) -> Void))
}

final class Webservice : RestaurantServiceProtocol  {
  
  static let shared = Webservice()
  
  func fetchRestaurantList(_ completion: @escaping ((Result<[Restaurant], ErrorResult>) -> Void)) {
    Alamofire.request("https://pmd-test-app-001.herokuapp.com/restaurants").responseArray { (response: DataResponse<[Restaurant]>) in

      if let parsedObj = response.result.value {
        completion(.success(parsedObj))
        return
      }

      if let error = response.error {
        completion(.failure(.network(string: error.localizedDescription)))
        return
      }
    }
  }
  
  func getRestaurant(_ id: String, completion: @escaping ((Restaurant?) -> Void)) {
    Alamofire.request("https://pmd-test-app-001.herokuapp.com/restaurant/" + id).responseObject { (response: DataResponse<Restaurant>) in

        if let parsedObj = response.result.value {
          completion(parsedObj)
          return
        }
  
        if let _ = response.error {
          completion(nil)
          return
        }
    }
  }
}
