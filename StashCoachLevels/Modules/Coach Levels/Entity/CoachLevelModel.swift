//
//  CoachLevelModel.swift
//  StashCoachLevels
//
//  Created by Samuel Boyce on 3/12/20.
//  Copyright © 2020 Samuel Boyce. All rights reserved.
//

import Foundation

struct CoachLevel: Codable {
    let id: Int
    let level: String
    let progress: Int
    let total: Int
    let imageUrl: String
    let accessible: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case level
        case progress
        case total
        case imageUrl = "bg_image_url"
        case accessible
    }
}

struct CoachLevelOverview: Codable {
    let title: String
}

struct CoachLevels: Codable {
    let success: Bool
    let status: Int
    let overview: CoachLevelOverview
    let achievements: [CoachLevel]
}
