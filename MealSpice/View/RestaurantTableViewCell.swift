//
//  RestaurantTableViewCell.swift
//  MealSpice
//
//  Created by Rohan Ratnaparkhi on 19/07/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

  @IBOutlet weak var restaurantImageView: UIImageView!
  @IBOutlet weak var restaurantName: UILabel!
  @IBOutlet weak var restaurantAddress: UILabel!
  
  var restaurant : Restaurant? {
    didSet {
      guard let restaurant = restaurant else {
        return
      }
      
      restaurantName?.text = "\(restaurant.name)"
      restaurantImageView.sd_setImage(with: URL(string: restaurant.pic), completed: nil)
      restaurantAddress?.text = "\(restaurant.address)"
    }
  }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
