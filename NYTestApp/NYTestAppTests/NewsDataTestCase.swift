//
//  NewsDataTestCase.swift
//  NYTestAppTests
//
//  Created by Rupesh Kumar on 26/06/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import XCTest

@testable import NYTestApp

class NewsDataTestCase: XCTestCase {
    
    func testParseEmptyNewsData() {
        
        // giving empty data
        let data = Data()
        
        // giving completion after parsing
        // expected valid converter with valid data
        let completion : ((Result<NewsData, ErrorResult>) -> Void) = { result in
            switch result {
            case .success(_):
                XCTAssert(false, "Expected failure when no data")
            default:
                break
            }
        }
        
        ParserHelper.parse(data: data, completion: completion)
    }
    
    func testWrongKeyNewsData() {
        
        // giving a wrong dictionary
        let dictionary = ["test" : 123 as AnyObject]
        
        // expected to return error of converter
        let result = NewsData.parseObject(dictionary: dictionary)
        
        switch result {
        case .success(_):
            XCTAssert(false, "Expected failure when wrong data")
        default:
            return
        }
    }
}
