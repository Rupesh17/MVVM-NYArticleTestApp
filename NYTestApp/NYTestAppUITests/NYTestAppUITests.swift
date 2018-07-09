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
    
    func testAppUI() {
        snapshot("App Screenshot Launch with indicator")
        snapshot("before load", waitForLoadingIndicator: false)
        snapshot("after load", waitForLoadingIndicator: true)
        let cells = app.tables.cells
        
        let firstCell = cells.element(boundBy: 0)
        firstCell.tap()
        snapshot("detail view")
    }
    
}
