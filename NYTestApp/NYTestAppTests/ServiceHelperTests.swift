//
//  ServiceHelperTests.swift
//  NYTestAppTests
//
//  Created by Rupesh Kumar on 26/06/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import XCTest

@testable import NYTestApp

class ServiceHelperTests: XCTestCase {
    
    func testCancelRequest() {
        
        // giving a "previous" session
        ServiceHelper.shared.fetchArticles { (_) in
            // ignore call
        }
        
        // Expected to task nil after cancel
        ServiceHelper.shared.cancelFetchArticles()
        XCTAssertNil(ServiceHelper.shared.task, "Expected task nil")
    }
}
