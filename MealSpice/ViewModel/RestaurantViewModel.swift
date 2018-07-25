//
//  RestaurantViewModel.swift
//  MealSpice
//
//  Created by Rohan Ratnaparkhi on 25/06/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import Foundation

class RestaurantViewModel {
  private var apiService = Webservice.shared
  private var restaurant: Restaurant!
  
  var restaurantName: Box<String> {
    return Box(self.restaurant.name)
  }
  var tagline: Box<String> {
    return Box(self.restaurant.tagline)
  }
  var rating: Box<Int> {
    return Box(self.restaurant.rating)
  }
  var imageUrl: Box<String> {
    return Box(self.restaurant.pic)
  }
  var address: Box<String> {
    return Box(self.restaurant.address)
  }
  
  public init(restaurantId id: String, completion: @escaping ((String) -> Void)) {
    apiService.getRestaurant(id) { restaurantDetails in
      if restaurantDetails == nil {
        completion("failed")
        return
      }
      self.restaurant = restaurantDetails
      completion("success")
      print(restaurantDetails)
    }
  }
}
