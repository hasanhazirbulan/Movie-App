//
//  Film.swift
//  MovieApp
//
//  Created by Hasan Hazırbulan on 21.07.2024.
//

import Foundation

struct Film : Codable {
    
    let title : String
    let year : String
    let imdbId : String
    let type : String
    let poster : String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
    
}

struct GelenFilmler : Codable {
    let films : [Film]
    
    private enum CodingKeys : String, CodingKey {
        case films = "Search"
    }
}

