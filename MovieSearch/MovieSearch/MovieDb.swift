//
//  MovieDb.swift
//  MovieSearch
//
//  Created by Jason Bell on 8/28/25.
//

import Foundation

class MovieDb {
    
    func getMovies() -> [Movie] {
        return [
            Movie(title: "Movie One"),
            Movie(title: "Movie Two"),
            Movie(title: "Movie Three")
        ]
    }
}
