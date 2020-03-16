//
//  CoachLevelRouter.swift
//  StashCoachLevels
//
//  Created by Samuel Boyce on 3/12/20.
//  Copyright © 2020 Samuel Boyce. All rights reserved.
//

import Foundation
import UIKit

class CoachLevelRouter: PresenterToRouterProtocol {
    class func createModule() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "CoachLevelTableViewController") as? CoachLevelTableViewController

            let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = CoachLevelPresenter()
            let interactor: PresentorToInteractorProtocol = CoachLevelInteractor()
            let router: PresenterToRouterProtocol = CoachLevelRouter()
            
            view?.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return view!;
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main", bundle: Bundle.main)
    }

}
