//
//  CoachLevelInteractorTests.swift
//  StashCoachLevelsTests
//
//  Created by Samuel Boyce on 3/17/20.
//  Copyright © 2020 Samuel Boyce. All rights reserved.
//

import XCTest

class CoachLevelInteractorTests: XCTestCase {
    var interactor: CoachLevelInteractor?
    var presenter: TestCoachLevelPresenter?
    
    override func setUp() {
        interactor = CoachLevelInteractor()
        presenter = TestCoachLevelPresenter()
        
        interactor?.presenter = presenter
    }

    override func tearDown() {
        interactor = nil
        presenter = nil
    }

    func testSuccessFetch() {
        interactor?.fetchCoachLevels(from: "goodJSON", fileType: .json)
        XCTAssertFalse(presenter!.levelFetchFailed)
        XCTAssertNotNil(presenter!.levels)
    }
    
    func testFailedFetchNoFile() {
        interactor?.fetchCoachLevels(from: "test", fileType: .json)
        XCTAssertTrue(presenter!.levelFetchFailed)
        XCTAssertNil(presenter!.levels)
    }
    
    func testFailedFetchCorruptedFile() {
        interactor?.fetchCoachLevels(from: "badJSON", fileType: .json)
        XCTAssertTrue(presenter!.levelFetchFailed)
        XCTAssertNil(presenter!.levels)
    }

}

extension CoachLevelInteractorTests {
    class TestCoachLevelPresenter: InteractorToPresenterProtocol {
        var levels: CoachLevels?
        var levelFetchFailed = false
        
        func coachLevelsFetched(levels: CoachLevels) {
            self.levels = levels
        }
        
        func coachLevelsFetchFailed() {
            levelFetchFailed = true
        }
    }
}
