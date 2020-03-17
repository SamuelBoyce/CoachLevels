//
//  CoachLevelInteractor.swift
//  StashCoachLevels
//
//  Created by Samuel Boyce on 3/12/20.
//  Copyright © 2020 Samuel Boyce. All rights reserved.
//

import Foundation

class CoachLevelInteractor: PresenterToInteractorProtocol {
    weak var presenter: InteractorToPresenterProtocol?
    
    func fetchCoachLevels(from fileName:String, fileType:FileType) {
        if let path = Bundle(for: type(of: self)).path(forResource: fileName, ofType: fileType.rawValue) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let levels = try JSONDecoder().decode(CoachLevels.self, from: data)
                self.presenter?.coachLevelsFetched(levels: levels)
              } catch {
                self.presenter?.coachLevelsFetchFailed()
              }
        } else {
            self.presenter?.coachLevelsFetchFailed()
        }
    }
}

enum FileType: String {
    case json = "json"
}
