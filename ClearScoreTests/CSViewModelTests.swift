//
//  CSViewModelTests.swift
//  ClearScoreTests
//
//  Created by Kuldeep Bhatt on 2022/08/03.
//

import XCTest
//import Alamofire
@testable import ClearScore

class CSViewModelTests: XCTestCase {
    var systemUnderTest: ScoreViewModel?

    override func setUp() {
        super.setUp()
        configureSystemUnderTestWithDataForCreditReportResponse()
    }

    override func tearDown() {
        systemUnderTest = nil
        super.tearDown()
    }
    
    func testScreenTitle() {
        XCTAssertEqual(systemUnderTest?.title, "Dashboard")
    }
    
    func testTotalScore() {
        XCTAssertEqual(systemUnderTest?.totalScore, "700")
    }
    
    func testAchievedScore() {
        XCTAssertEqual(systemUnderTest?.scoreAchieved, "514")
    }
    
    func testProgress() {
        XCTAssertEqual(systemUnderTest?.progress, 514)
    }
    
    func testUnknownScore() {
        XCTAssertEqual(systemUnderTest?.unknownTotalScore, "--")
        XCTAssertEqual(systemUnderTest?.unknownScoreAchieved, "--")
    }
    
}

// MARK: Configs
extension CSViewModelTests {
    func configureSystemUnderTestWithDataForCreditReportResponse() {
        let jsonData = TestHelpers.jsonData(from: "CreditReport")
        let jsonDecoder = JSONDecoder()
        guard let jsonData = jsonData else {
            return
        }

        let score = try? jsonDecoder.decode(Score.self, from: jsonData) as Score
        systemUnderTest = ScoreViewModel(with: score)
    }
}
