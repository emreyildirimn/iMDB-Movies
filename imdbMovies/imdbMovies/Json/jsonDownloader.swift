//
//  jsonDownloader.swift
//  imdbMovies
//
//  Created by mac on 9.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

func jsonStart() -> [Results] {
    var page : Int = 1
    var movies: [Results] = []
    let decoder = JSONDecoder()
    while (page <= 50) {
        let addressUrl = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=5a89c07838e91d57f99884f9f6bfa290&language=tr-TR&page=\(page)&region=TR")
        do {
            let data = try Data(contentsOf: addressUrl!)
            let dt = try decoder.decode(json.self, from: data)
            movies.append(contentsOf: dt.results)
        } catch {
            print(error)
        }
        page += 1
    }
    return movies
}
    
    
