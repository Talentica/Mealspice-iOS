//
//  RestaurantListViewModelTests.swift
//  MealSpiceTests
//
//  Created by Nishu Priya on 7/27/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import XCTest
@testable import MealSpice

class RestaurantListViewModelTests: XCTestCase {
    
    var viewModel: RestaurantListViewModel!
    var dataSource: RestaurantListDataSource!
    var service: RestaurantServiceProtocol?
    
    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    
//    func testSortByName() {
//    }
    
    
    
    
//    func testSortByRate() {
//    }
    
    
    
    
    
    
    
    
    
//    func testFetchWithNoService() {
//    }
//    func testGetRestaurantSuccessList() {
//    }
//    func testGetRestaurantListFailure() {
//    }
}

fileprivate class MockWebService: RestaurantServiceProtocol {
    var restaurants: [Restaurant]?
    func fetchRestaurantList(_ completion: @escaping ((Result<[Restaurant], ErrorResult>) -> Void)) {
        if restaurants != nil {
            completion(Result.success(restaurants!))
        } else {
            completion(Result.failure(ErrorResult.custom(string: "No restaurnats")))
        }
    }
}
