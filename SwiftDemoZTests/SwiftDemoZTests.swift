//
//  SwiftDemoZTests.swift
//  SwiftDemoZTests
//
//  Created by Jhonny on 10/29/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import XCTest
@testable import SwiftDemoZ

class SwiftDemoZTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func test_givenValidResourceExists_dataIsReturned() {
        let service = NetworkService(session: URLSession(configuration: .ephemeral),
                                     modifiers: TestCases1.listQuestions.build())
        let expectation = self.expectation(description: "resource")
        var resourceData: Data?
        var resourceError: Error?
        service.apiCall { (result) in
            switch result {
            case .success(let data):
                resourceData = data
            case .failure(let error):
                resourceError = error
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertNil(resourceError)
        XCTAssertNotNil(resourceData)
    }
    
}

enum TestCases1 {
    case listQuestions
}

extension TestCases1: Request {
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return API.host + API.mainURL
    }
}
