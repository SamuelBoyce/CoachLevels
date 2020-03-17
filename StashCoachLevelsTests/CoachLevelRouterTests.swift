//
//  CoachLevelRouterTests.swift
//  StashCoachLevelsTests
//
//  Created by Samuel Boyce on 3/17/20.
//  Copyright © 2020 Samuel Boyce. All rights reserved.
//

import XCTest

class CoachLevelRouterTests: XCTestCase {
    func testModuleCreation() {
        let viewController = CoachLevelRouter.createModule()
        
        XCTAssert(viewController.isMember(of: CoachLevelTableViewController.self))
    }
}
