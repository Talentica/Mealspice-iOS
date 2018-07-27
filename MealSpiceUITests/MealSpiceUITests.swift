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
    let KRestaurantViewTitle = "Restaurant List"
    let kRestaurantDetailTitle = "Resturant Detail"
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        

    }
    
    func testCellImageSize() {
        let cell = app/*@START_MENU_TOKEN@*/.tables["Restaurant_List_Table"]/*[[".otherElements[\"Restaurant_ListSuperView\"].tables[\"Restaurant_List_Table\"]",".tables[\"Restaurant_List_Table\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.cells["cell_0"]
        let exists = cell.waitForExistence(timeout: 0.3)
        if exists {
            let frame = cell.images["restaurantImageView"].frame
            XCTAssert(frame.size.height == 74 && frame.size.width == 74, "Check image frame")
        } else {
            XCTAssert(false, "Wait failed")
        }
    }
    
    func testNavigationTitleForDetailScreenExists() {
        let cell = app.tables["Restaurant_List_Table"].cells["cell_1"]
        cell.waitForExistence(timeout: 2.0)
        cell.tap()
        let nextPageNavigationTitle = app.navigationBars["Restaurant Detail"]
        if nextPageNavigationTitle.waitForExistence(timeout: 0.3) == true {
            XCTAssert(true, "Element found")
        } else {
            XCTAssert(false, "Failed to find element")
        }
    }
    
    func testBothButtonsEnabledAtStart() {
        let nameButton = app.buttons["name_button"]
        let ratingButton = app.buttons["rating_button"]
        
        if nameButton.exists && ratingButton.exists {
            XCTAssert((nameButton.isEnabled && ratingButton.isEnabled), "checking if both buttons are enabled")
        } else {
            XCTAssert(false, "Buttons not present")
        }
    }
    
    func testRatingButtonBecomesDisabledOnceTapped() {
        let nameButton = app.buttons["name_button"]
        let ratingButton = app.buttons["rating_button"]
        
        if nameButton.exists && ratingButton.exists {
            nameButton.tap()
            XCTAssert((!nameButton.isEnabled && ratingButton.isEnabled), "checking if both buttons are enabled")
            
            ratingButton.tap()
            XCTAssert((nameButton.isEnabled && !ratingButton.isEnabled), "checking if both buttons are enabled")
        } else {
            XCTAssert(false, "Buttons not present")
        }
    }
}
