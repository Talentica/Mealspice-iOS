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
        viewModel = RestaurantListViewModel(dataSource: dataSource)
    }
    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }
    
    func testSortByName() {
        let rest1 = Restaurant()
        rest1.name = "BRest"
        let rest2 = Restaurant()
        rest2.name = "ARest"
        let list = [rest1, rest2]
        let desiredList = [rest2, rest1]
        let endList = viewModel.sortListByName(list: list)
        if endList == desiredList {
            XCTAssert(true)
        }
    }
    func testSortByRate() {
        let rest1 = Restaurant()
        rest1.rating = 1
        let rest2 = Restaurant()
        rest2.rating = 2
        let rest3 = Restaurant()
        rest3.rating = 3
        let list = [rest1, rest2, rest3]
        
        let desiredList = [rest3, rest2, rest1]
        let endList = viewModel.sortListByName(list: list)
        if endList == desiredList {
            XCTAssert(true)
        }
    }
    func testFetchWithNoService() {
        // giving no service to a view model
        viewModel.service = nil
        // expected to not be able to fetch currencies
        viewModel.fetchRestaurantList() { result in
            switch result {
            case .success(_) :
                XCTAssert(false, "ViewModel should not be able to fetch without service")
            default:
                break
            }
        }
    }
    func testGetRestaurantSuccessList() {
        let mockWebservice = MockWebService()
        mockWebservice.restaurants = [Restaurant()]
        viewModel.service = mockWebservice
        viewModel.fetchRestaurantList() {
            result in
            switch result {
            case .success :
                XCTAssert(true, "There is one restaurant, and it should be success")
            case .failure :
                XCTAssert(false, "There is one restaurant, and it should be success")
            }
            
        }
    }
    func testGetRestaurantListFailure() {
        let mockWebservice = MockWebService()
        viewModel.service = mockWebservice
        viewModel.fetchRestaurantList() {
            result in
            switch result {
            case .success :
                XCTAssert(true, "There is no restaurant, and it should be failure")
            case .failure :
                XCTAssert(true, "There are no restaurants, and it should be failure")
            }
        }
    }
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
