//
//  RestaurantsViewController.swift
//  MealSpice
//
//  Created by Rohan Ratnaparkhi on 19/07/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import UIKit

class RestaurantsViewController: UIViewController {

  
  @IBOutlet weak var restaurantsTableView: UITableView!
  
  let dataSource = RestaurantListDataSource()
  
  lazy var viewModel : RestaurantListViewModel = {
    let viewModel = RestaurantListViewModel(dataSource: dataSource)
    return viewModel
  }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.restaurantsTableView.dataSource = self.dataSource
      self.restaurantsTableView.rowHeight = 120;
      self.viewModel.fetchRestaurantList() { result in
        print(result)
        self.restaurantsTableView.reloadData()
      }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
