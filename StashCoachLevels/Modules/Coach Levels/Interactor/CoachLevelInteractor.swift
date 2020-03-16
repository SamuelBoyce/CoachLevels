//
//  CoachLevelInteractor.swift
//  StashCoachLevels
//
//  Created by Samuel Boyce on 3/12/20.
//  Copyright © 2020 Samuel Boyce. All rights reserved.
//

import Foundation

class CoachLevelInteractor: PresentorToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    
    func fetchCoachLevels() {
        if let path = Bundle.main.path(forResource: "achievements", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let levels = try JSONDecoder().decode(CoachLevels.self, from: data)
                self.presenter?.coachLevelsFetched(levels: levels)
              } catch {
                self.presenter?.coachLevelsFetchFailed()
              }
        }
    }
}
