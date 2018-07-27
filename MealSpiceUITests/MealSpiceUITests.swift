//
//  MealSpiceUITests.swift
//  MealSpiceUITests
//
//  Created by Nishu Priya on 7/25/18.
//  Copyright © 2018 Talentica. All rights reserved.
//

import XCTest

class MealSpiceUITests: XCTestCase {
    
    var app: XCUIApplication!
    let TIMEOUT = TimeInterval(1)
    let kRestaurantDetailTitle = "Resturant Detail"
    
    override func setUp() {
        super.setUp()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        
    }
    
//    func testCellImageSize() {
//    }
//
//    func testNavigationTitleForDetailScreenExists() {
//    }
//
//    func testBothButtonsEnabledAtStart() {
//    }
//    func testRatingButtonBecomesDisabledOnceTapped() {
//    }
}
