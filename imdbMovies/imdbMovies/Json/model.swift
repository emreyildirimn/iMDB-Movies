//
//  model.swift
//  imdbMovies
//
//  Created by mac on 8.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

struct json : Decodable {
    let results : [Results]
}

struct Results : Decodable {
    let vote_average : Double
    let title : String
    let overview : String
    let poster_path : String
    let genre_ids : [Int]
}





