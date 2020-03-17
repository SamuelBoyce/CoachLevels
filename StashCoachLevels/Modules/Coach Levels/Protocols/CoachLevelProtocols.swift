//
//  CoachLevelProtocols.swift
//  StashCoachLevels
//
//  Created by Samuel Boyce on 3/12/20.
//  Copyright © 2020 Samuel Boyce. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToViewProtocol: class {
    func showCoachLevels(levels: CoachLevels)
    func showError()
}

protocol InteractorToPresenterProtocol: class {
    func coachLevelsFetched(levels: CoachLevels)
    func coachLevelsFetchFailed()
}

protocol PresenterToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? {get set}
    func fetchCoachLevels(from fileName:String, fileType:FileType)
}

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func updateView()
}

protocol PresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}
