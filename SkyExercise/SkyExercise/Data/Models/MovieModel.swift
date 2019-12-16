//
//  MovieModel.swift
//  SkyExercise
//
//  Created by Matheus França on 16/12/19.
//  Copyright © 2019 Matheus França. All rights reserved.
//

import Foundation

struct MovieModel: Codable {
    var title: String?
    var overview: String?
    var duration: String?
    var releaseYear: String?
    var coverUrl: String?
    var backdropsUrl: [String]?
    var id: String?
    
    enum CodingKeys: String, CodingKey {
        case releaseYear = "release_year"
        case coverUrl = "cover_url"
        case backdropsUrl = "backdrops_url"
        
        case title, overview, duration, id
    }
}
