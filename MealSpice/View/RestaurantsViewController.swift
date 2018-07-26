//
//  RestaurantsViewController.swift
//  MealSpice
//
//  Created by Rohan Ratnaparkhi on 19/07/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import UIKit

class RestaurantsViewController: UIViewController {

  //  MARK:- Outlets
  @IBOutlet weak var restaurantsTableView: UITableView!
  
  //  MARK:- Other Variables
  let dataSource = RestaurantListDataSource()
  var slug = ""
  lazy var viewModel : RestaurantListViewModel = {
    let viewModel = RestaurantListViewModel(dataSource: dataSource)
    return viewModel
  }()
  
  //  MARK:- ViewController Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Restaurant List"
    self.restaurantsTableView.delegate = self
    self.restaurantsTableView.dataSource = self.dataSource
    self.restaurantsTableView.rowHeight = 120;
    self.viewModel.fetchRestaurantList() { result in
      self.restaurantsTableView.reloadData()
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showRestaurantDetailSegue" {
      let destVc = segue.destination as! DetailsViewController
      destVc.restaurantId = self.slug
    }
  }
}

//  MARK:- TableView Delegate
extension RestaurantsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
    self.slug = (cell.restaurantSlug.text)!
    self.performSegue(withIdentifier: "showRestaurantDetailSegue", sender: nil)
  }
}
