//
//  CoachLevelPresenter.swift
//  StashCoachLevels
//
//  Created by Samuel Boyce on 3/12/20.
//  Copyright © 2020 Samuel Boyce. All rights reserved.
//

import Foundation

class CoachLevelPresenter: ViewToPresenterProtocol {
    weak var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func updateView() {
        interactor?.fetchCoachLevels(from: "achievements", fileType: .json)
    }
}

extension CoachLevelPresenter: InteractorToPresenterProtocol {
    func coachLevelsFetched(levels: CoachLevels) {
        view?.showCoachLevels(levels: levels)
    }
    
    func coachLevelsFetchFailed() {
        view?.showError()
    }
}
