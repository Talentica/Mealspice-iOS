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
  @IBOutlet weak var rating: UILabel!
  @IBOutlet weak var address: UILabel!
  
  //  MARK:- Other Variables
  var restaurantId: String = ""
  var restaurantViewModel: RestaurantViewModel!

  //  MARK:- ViewController Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Restaurant Detail"
    self.restaurantViewModel = RestaurantViewModel(restaurantId: self.restaurantId) { status in
      if status == "success" {
        self.bindOutlets()
      } else {
        // TODO: handle error here
      }
    }
  }
  
  //  MARK:- Other Methods
  func bindOutlets() {
    // bind properties in RestaurantViewModel to outlets
    restaurantViewModel.restaurantName.bind { [unowned self] in
      self.restaurantName.text = $0
    }
    restaurantViewModel.tagline.bind { [unowned self] in
      self.tagline.text = $0
    }
    restaurantViewModel.rating.bind { [unowned self] in
      self.rating.text = "\($0)"
    }
    restaurantViewModel.imageUrl.bind { [unowned self] in
      self.imageView.sd_setImage(with: URL(string: $0), completed: nil)
    }
    restaurantViewModel.address.bind { [unowned self] in
      self.address.text = $0
    }
  }
  
  
}

