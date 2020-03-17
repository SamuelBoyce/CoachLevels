//
//  CoachLevelViewTests.swift
//  StashCoachLevelsTests
//
//  Created by Samuel Boyce on 3/17/20.
//  Copyright © 2020 Samuel Boyce. All rights reserved.
//

import XCTest

class CoachLevelViewTests: XCTestCase {
    var view: CoachLevelTableViewController?

    override func setUp() {
        view = CoachLevelTableViewController()
    }

    override func tearDown() {
        view = nil
    }

    func testShowCoachLevels() {
        view?.showCoachLevels(levels: TestObjects.testCoachLevels)
        XCTAssert(view?.levels.count == 2)
        XCTAssert(view?.levels[0].level == "1")
        XCTAssert(view?.title == "Test")
    }
}
