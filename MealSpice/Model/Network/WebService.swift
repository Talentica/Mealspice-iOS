//
//  WebService.swift
//  MealSpice
//
//  Created by Rohan Ratnaparkhi on 09/06/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import Foundation

import Foundation

class WebService {
  func getRestaurantFromServer(_ id: String) -> Restaurant {
    // This should call the actual api to get the restaurant details using the id passed.
    return Restaurant(name: "Lombardi's Pizza",
                      address: "32 Spring Street, New York 10012",
                      tagline: "The paradise of spice blends",
                      rating: 4,
                      pic: "https://b.zmtcdn.com/data/res_imagery/16771079_RESTAURANT_da60c9abb32fa64cddc148a2795ae43c_c.jpg",
                      comments: 1)
  }
  
  func addComment(comment: Comment) -> Int {
    // This should call the actual api to add a comment and then return total no. of comments
    return 2;
  }
}
