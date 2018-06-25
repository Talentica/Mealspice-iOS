//
//  RestaurantViewModel.swift
//  MealSpice
//
//  Created by Rohan Ratnaparkhi on 25/06/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import Foundation

class RestaurantViewModel {
  private var apiService = WebService()
  private var restaurant: Restaurant!
  
  //  keeping this show how it can be done without Boxing
  var restaurantName: String {
    return self.restaurant.name
  }
  
  //  using boxing so that we can bind outlets to these properties
  var tagline: Box<String> {
    return Box(self.restaurant.tagline)
  }
  var comments: Box<Int> {
    return Box(self.restaurant.comments)
  }
  var imageUrl: Box<String> {
    return Box(self.restaurant.pic)
  }
  var address: Box<String> {
    return Box(self.restaurant.address)
  }
  
  public init(restaurantId id: String) {
    self.restaurant = apiService.getRestaurantFromServer(id)
  }
}
