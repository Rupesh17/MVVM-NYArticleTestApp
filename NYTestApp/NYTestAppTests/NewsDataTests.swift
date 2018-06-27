//
//  NewsDataTests.swift
//  NYTestAppTests
//
//  Created by Rupesh Kumar on 26/06/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import XCTest

@testable import NYTestApp

let kSampleArticleTitle = "Trump Retreats on Separating Families, but Thousands May Remain Apart"
let kSampleArticleCount = 1
let kSampleArticlePubDate = "2018-06-20"

class NewsDataTests: XCTestCase {
    
    func testParseEmptyNewsData() {
        
        // giving empty data
        let data = Data()
        
        // giving completion after parsing
        // expected valid NewsData with   valid Article data
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
    
    func testParseNewsData() {
        
        // giving a sample json file
        guard let data = FileManager.readJson(forResource: "sample") else {
            XCTAssert(false, "Can't get data from sample.json")
            return
        }
        
        // giving completion after parsing
        // expected valid converter with valid data
        let completion : ((Result<NewsData, ErrorResult>) -> Void) = { result in
            switch result {
            case .failure(_):
                XCTAssert(false, "Expected valid newsData")
            case .success(let newsData):
                
                XCTAssertEqual(newsData.articles?.count, kSampleArticleCount, "Expected \(kSampleArticleCount)")
                XCTAssertEqual(newsData.articles?.first?.name, kSampleArticleTitle, "Expected \(kSampleArticleTitle)")
                if let date = newsData.articles?.first?.publishedDate
                {
                    XCTAssertEqual(Utils.getStringFromDate(date: date), kSampleArticlePubDate, "Expected \(kSampleArticlePubDate)")
                }
            }
        }
        
        ParserHelper.parse(data: data, completion: completion)
    }
    
    func testWrongKeyNewsData() {
        
        // giving a wrong dictionary
        let dictionary = ["test" : 123 as AnyObject]
        
        // expected to return error of NewsData
        let result = NewsData.parseObject(dictionary: dictionary)
        
        switch result {
        case .success(_):
            XCTAssert(false, "Expected failure when wrong data")
        default:
            return
        }
    }
}

extension FileManager {
    
    static func readJson(forResource fileName: String ) -> Data? {
        
        let bundle = Bundle(for: NewsDataTests.self)
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                // handle error
            }
        }
        
        return nil
    }
}
