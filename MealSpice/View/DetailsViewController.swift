//
//  ViewController.swift
//  MealSpice
//
//  Created by Rohan Ratnaparkhi on 09/06/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {
  
  //  MARK:- Outlets
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var restaurantName: UILabel!
  @IBOutlet weak var tagline: UILabel!
  @IBOutlet weak var comments: UILabel!
  @IBOutlet weak var address: UILabel!
  @IBOutlet weak var commentImageView: UIImageView!
  
  //  MARK:- Other Variables
  var restaurantId: String = "lombardis-pizza"
  var apiService = WebService()
  var restaurant: Restaurant!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    restaurant = apiService.getRestaurantFromServer(self.restaurantId)
    
    self.restaurantName.text = restaurant.name
    self.tagline.text = restaurant.tagline
    self.comments.text = "\(restaurant.comments)"
    self.imageView.sd_setImage(with: URL(string: (restaurant.pic)), completed: nil)
    self.address.text = restaurant.address
    
  }
  
}

