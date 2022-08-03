//
//  CSDataProviderTests.swift
//  ClearScoreTests
//
//  Created by Kuldeep Bhatt on 2022/08/03.
//

import XCTest
@testable import ClearScore

class CSDataProviderTests: XCTestCase {
    var dataProvider: DataProvider?

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testThatSuccessBlockIsAlwaysCalledWhenFetching() {
        // Given: Success expectations
        let successBlockExpectation = expectation(description: "Waiting for success block to be called")
        
        // When: Credit Score is fetched
        DataProvider.performMembersCreditScoreRequest { score, error in
            XCTAssertNotNil(score)
            successBlockExpectation.fulfill()
        }
        
        // Then: All required blocks are called
        wait(for: [successBlockExpectation], timeout: 2.0)
    }
}
