//
//  TeamTests.swift
//  nrlstatsTests
//
//  Created by Marc O'Neill on 30/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import XCTest
@testable import nrlstats

class TeamTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testId_GivenJsonData() {
        let jsonData = """
            {
                "id": 23,
                "name": "",
                "code": "",
                "short_name": ""
            }
        """.data(using: .utf8)!

        let team = try? JSONDecoder().decode(Team.self, from: jsonData)
        XCTAssert(team?.id == 23, "Incorrect ID for team")
    }

    func testName_GivenJsonData() {
        let jsonData = """
            {
                "id": 1,
                "name": "Test",
                "code": "",
                "short_name": ""
            }
        """.data(using: .utf8)!

        let team = try? JSONDecoder().decode(Team.self, from: jsonData)
        XCTAssert(team?.name == "Test", "Incorrect name for team")
    }

    func testCode_GivenJsonData() {
        let jsonData = """
            {
                "id": 1,
                "name": "",
                "code": "TES",
                "short_name": ""
            }
        """.data(using: .utf8)!

        let team = try? JSONDecoder().decode(Team.self, from: jsonData)
        XCTAssert(team?.code == "TES", "Incorrect code for team")
    }

    func testShortName_GivenJsonData() {
        let jsonData = """
            {
                "id": 1,
                "name": "",
                "code": "",
                "short_name": "Short"
            }
        """.data(using: .utf8)!

        let team = try? JSONDecoder().decode(Team.self, from: jsonData)
        XCTAssert(team?.shortName == "Short", "Incorrect shortName for team")
    }
}
