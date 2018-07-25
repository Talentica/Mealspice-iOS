//
//  Restaurant.swift
//  MealSpice
//
//  Created by Rohan Ratnaparkhi on 09/06/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import Foundation
import ObjectMapper

class Restaurant: NSObject, Mappable {
  var name: String = ""
  var address: String = ""
  var tagline: String = ""
  var rating: Int = 0
  var pic: String = ""
  
  required init?(map: Map){
  }
  
  override init() {
    super.init()
  }
  
  func mapping(map: Map) {
    name <- map["name"]
    pic <- map["pic"]
    address <- map["address"]
    tagline <- map["tagline"]
    rating <- map["rating"]
  }
}
