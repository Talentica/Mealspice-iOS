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
  var restaurantViewModel: RestaurantViewModel!

  //  MARK:- ViewController Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.restaurantViewModel = RestaurantViewModel(restaurantId: self.restaurantId)
    bindOutlets()
  }
  
  //  MARK:- Other Methods
  func bindOutlets() {
    // since we haven't used boxing for restaurantName in RestaurantViewModel;
    self.restaurantName.text = restaurantViewModel.restaurantName
    
    // bind properties in RestaurantViewModel to outlets
    restaurantViewModel.tagline.bind { [unowned self] in
      self.tagline.text = $0
    }
    restaurantViewModel.comments.bind { [unowned self] in
      self.comments.text = "\($0)"
    }
    restaurantViewModel.imageUrl.bind { [unowned self] in
      self.imageView.sd_setImage(with: URL(string: $0), completed: nil)
    }
    restaurantViewModel.address.bind { [unowned self] in
      self.address.text = $0
    }
  }
  
  
}

