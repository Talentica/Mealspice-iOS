//
//  RestaurantListDataSource.swift
//  MealSpice
//
//  Created by Rohan Ratnaparkhi on 24/07/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import Foundation
import UIKit

class RestaurantListDataSource : GenericDataSource<Restaurant>, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.value.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantTableViewCell", for: indexPath) as! RestaurantTableViewCell
    
    let restaurant = self.data.value[indexPath.row]
    cell.restaurant = restaurant
    
    return cell
  }
}
