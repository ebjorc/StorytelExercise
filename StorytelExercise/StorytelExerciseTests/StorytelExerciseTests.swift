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
    let harryQueryController = HarryQueryViewController()

    func testFetch() {
        XCTAssertEqual(harryQueryController.harryBooks.count, 0)
        XCTAssertEqual(harryQueryController.nextPageToken, "10")
        
        harryQueryController.fetchBooks()
        // Wait for fetching
        sleep(5)
        
        // Make sure that more books have been added
        XCTAssertEqual(harryQueryController.harryBooks.count, 10)
        XCTAssertEqual(harryQueryController.nextPageToken, "20")
        XCTAssertEqual(harryQueryController.harryBooks[0].authors[0].name, "J.K. Rowling")
        XCTAssertEqual(harryQueryController.harryBooks[0].narrators.count, 0)
        
        XCTAssertEqual(harryQueryController.harryBooks[3].narrators.count, 1)
        
        let narratorString = "Piotr Fronczewski"
        XCTAssertEqual(harryQueryController.harryBooks[3].narrators[0].name, narratorString)
    }
    
    func testShowSpinner(){
        harryQueryController.showSpinner()
        XCTAssertEqual(harryQueryController.spinner.isHidden, false)
        XCTAssertEqual(harryQueryController.spinner.isAnimating, true)
    }
}
