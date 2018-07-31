//
//  LastMatchStatsTests.swift
//  nrlstatsTests
//
//  Created by Marc O'Neill on 30/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import XCTest
@testable import nrlstats

class LastMatchStatsTests: XCTestCase {
    
    let jsonData = """
        {
            "errors": 1,
            "goals": 0,
            "intercepted": 0,
            "intercepts": 0,
            "kicks": 0,
            "points": 0,
            "test_double": 34.5,
            "test_string": "TestString"
        }
    """.data(using: .utf8)!

    func testStatsMapToDictionary() {
        let stats = try? JSONDecoder().decode(LastMatchStats.self, from: jsonData)
        XCTAssert(stats?.matchStats.count == 8, "Incorrect number of stats")
    }

    func testErrors_GivenJsonData() {
        let stats = try? JSONDecoder().decode(LastMatchStats.self, from: jsonData)
        XCTAssert(stats?.matchStats["errors"] as! Int == 1, "Incorrect value for errors")
    }

    func testString_GivenJsonData() {
        let stats = try? JSONDecoder().decode(LastMatchStats.self, from: jsonData)
        XCTAssert(stats?.matchStats["test_string"] as! String == "TestString", "Incorrect value for test_string")
    }

    func testDouble_GivenJsonData() {
        let stats = try? JSONDecoder().decode(LastMatchStats.self, from: jsonData)
        XCTAssertNotNil(stats?.matchStats["test_double"] as! Double == 34.5, "Incorrect value for test_double")
    }

    func testNullValuesIgnored() {
        let jsonData = """
        {
            "errors": 1,
            "field_goal_attempts": null
        }
        """.data(using: .utf8)!

        let stats = try? JSONDecoder().decode(LastMatchStats.self, from: jsonData)
        XCTAssertNil(stats?.matchStats["field_goal_attempts"], "Null value not ignored")
    }
}
