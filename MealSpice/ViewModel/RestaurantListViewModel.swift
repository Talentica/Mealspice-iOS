//
//  RestaurantListViewModel.swift
//  MealSpice
//
//  Created by Rohan Ratnaparkhi on 24/07/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import Foundation

struct RestaurantListViewModel {
  
    weak var dataSource : GenericDataSource<Restaurant>?
    weak var service: RestaurantServiceProtocol?
  
    init(service: RestaurantServiceProtocol = Webservice.shared, dataSource : GenericDataSource<Restaurant>?) {
        self.dataSource = dataSource
        self.service = service
    }
 
    func fetchRestaurantList(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
        guard let service = service else {
                 completion?(Result.failure(ErrorResult.custom(string: "Missing service")))
            return
        }
        service.fetchRestaurantList { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let restaurantList) :
                    // reload data
                    self.dataSource?.data.value = restaurantList
                    completion?(Result.success(true))
                    break
                case .failure(let error) :
                    print("Parser error \(error)")
                    completion?(Result.failure(error))
                    break
                }
            }
        }
    }
    func sortByName() {
        dataSource?.data.value = sortListByName(list: (dataSource?.data.value ?? []))
    }
    func sortByRate() {
        dataSource?.data.value = sortListByRate(list: (dataSource?.data.value ?? []))
    }
    func sortListByName(list:[Restaurant]) -> [Restaurant] {
        var mutableList = list
        mutableList.sort(by: {
            rest1, rest2 in
            return (rest1.name < rest2.name)
        })
        return mutableList
    }
    func sortListByRate(list:[Restaurant]) -> [Restaurant] {
        var mutableList = list
        mutableList.sort(by: {
            rest1, rest2 in
            return (rest1.rating > rest2.rating)
        })
        return mutableList
    }
}
