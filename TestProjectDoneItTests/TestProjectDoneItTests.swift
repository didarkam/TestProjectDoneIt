//
//  TestProjectDoneItTests.swift
//  TestProjectDoneItTests
//
//  Created by didarkam on 5/10/18.
//  Copyright © 2018 test. All rights reserved.
//

import XCTest
@testable import TestProjectDoneIt

class TestProjectDoneItTests: XCTestCase {
    
    var sessionUnderTest: URLSession!
    
    // Asynchronous test: success fast, failure slow
    func testValidCallToMoviesDb() {
        // given
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=5a36b4f9c439feb174a3458a889e9c56")
        // 1
        let promise = expectation(description: "Status code: 200")
        
        // when
        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            // then
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        // 3
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    override func setUp() {
        super.setUp()
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sessionUnderTest = nil
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
