//
//  CoachLevelPresenterTests.swift
//  StashCoachLevelsTests
//
//  Created by Samuel Boyce on 3/17/20.
//  Copyright © 2020 Samuel Boyce. All rights reserved.
//

import XCTest

class CoachLevelPresenterTests: XCTestCase {
    var presenter: CoachLevelPresenter?
    var view: TestCoachLevelViewController?
    var interactor: TestCoachLevelInteractor?

    override func setUp() {
        presenter = CoachLevelPresenter()
        interactor = TestCoachLevelInteractor()
        view = TestCoachLevelViewController()
        
        presenter?.interactor = interactor
        interactor?.presenter = presenter
        
        presenter?.view = view
        view?.presenter = presenter
    }

    override func tearDown() {
        presenter = nil
        interactor = nil
        view = nil
    }

    func testUpdateView() {
        presenter?.updateView()
        XCTAssertTrue(interactor?.levelsFetched ?? false)
    }
    
    func testLevelFetch() {
        presenter?.coachLevelsFetched(levels: TestObjects.testCoachLevels)
        XCTAssert(view?.levels.count == 2)
        XCTAssert(view?.levels[0].level == "1")
    }
    
    func testShowError() {
        presenter?.coachLevelsFetchFailed()
        XCTAssertTrue(view?.errorShown ?? false)
    }
}

extension CoachLevelPresenterTests {
    class TestCoachLevelInteractor: PresenterToInteractorProtocol {
        var presenter: InteractorToPresenterProtocol?
        var levelsFetched = false
        
        func fetchCoachLevels(from fileName: String, fileType: FileType) {
            levelsFetched = true
        }
    }
    
    class TestCoachLevelViewController: PresenterToViewProtocol {
        var errorShown = false
        var presenter: ViewToPresenterProtocol?
        var levels: [CoachLevel] = []
        
        func showCoachLevels(levels: CoachLevels) {
            self.levels = levels.achievements
        }
        
        func showError() {
            errorShown = true
        }
    }
}
