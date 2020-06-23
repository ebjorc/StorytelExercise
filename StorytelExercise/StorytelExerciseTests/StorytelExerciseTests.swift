//
//  StorytelExerciseTests.swift
//  StorytelExerciseTests
//
//  Created by Erik Björck on 2020-05-30.
//  Copyright © 2020 Erik Björck. All rights reserved.
//

import XCTest
@testable import StorytelExercise

class StorytelExerciseTests: XCTestCase {

    func testFetch() {
        let harryQueryController = HarryQueryViewController()
        // This is an example of a functional test case.
        XCTAssertEqual(harryQueryController.harryBooks.count, 0)
        XCTAssertEqual(harryQueryController.nextPageToken, "10")
        
        harryQueryController.fetch
        sleep(10)
        harryQueryController.tableView.reloadData()
        
        XCTAssertEqual(harryQueryController.harryBooks.count, 10)
        XCTAssertEqual(harryQueryController.nextPageToken, "20")
    }
}
