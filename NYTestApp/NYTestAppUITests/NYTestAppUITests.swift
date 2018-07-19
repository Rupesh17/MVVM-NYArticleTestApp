//
//  NYTestAppUITests.swift
//  NYTestAppUITests
//
//  Created by Rupesh Kumar on 26/06/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import XCTest

class NYTestAppUITests: XCTestCase {
        
    var app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        setupSnapshot(app)
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTableInteraction() {
        // Assert that we are displaying the tableview
        let cells = app.tables.cells
        snapshot("App Screenshot Launch with indicator")

        // Get an array of cells
        if cells.count > 0 {
            snapshot("after load")
            let count: Int = (cells.count - 1)
            
            let promise = expectation(description: "Wait for table cells")
            
            for i in stride(from: 0, to: count , by: 1) {
                // Grab the first cell and verify that it exists and tap it
                let tableCell = cells.element(boundBy: i)
                
                XCTAssertTrue(tableCell.exists, "The \(i) cell is in place on the table")
                
                // Does this actually take us to the next screen
                tableCell.tap()
                
                if i == (count - 1) {
                    snapshot("detail View")
                    promise.fulfill()
                }

                // Back
                app.navigationBars.buttons.element(boundBy: 0).tap()
            }
            
            waitForExpectations(timeout: 50, handler: nil)
            XCTAssertTrue(true, "Finished validating the table cells")
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
    }
}
