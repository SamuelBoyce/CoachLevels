//
//  TestObjects.swift
//  StashCoachLevelsTests
//
//  Created by Samuel Boyce on 3/17/20.
//  Copyright © 2020 Samuel Boyce. All rights reserved.
//

import Foundation

enum TestObjects {
    static let testCoachLevels: CoachLevels = CoachLevels(success: true, status: 200, overview: CoachLevelOverview(title: "Test"), achievements: [
        CoachLevel(id: 1, level: "1", progress: 0, total: 100, imageUrl: "", accessible: true),
        CoachLevel(id: 2, level: "2", progress: 0, total: 100, imageUrl: "", accessible: false)
    ])
}
