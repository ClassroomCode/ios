//
//  Favorite.swift
//  MovieSearch
//
//  Created by Jason Bell on 9/4/25.
//

import Foundation
import SwiftData

@Model
class Favorite : Identifiable {
    var id : String { imdbID }
    var title: String
    var year = ""
    var imdbID = ""
    var poster : URL?
    var boxOffice: String?
    
    init(title: String, year: String = "", imdbID: String = "", poster: URL? = nil, boxOffice: String? = nil) {
        self.title = title
        self.year = year
        self.imdbID = imdbID
        self.poster = poster
        self.boxOffice = boxOffice
    }
    
    init(movie: Movie) {
        self.title = movie.title
        self.year = movie.year
        self.imdbID = movie.imdbID
        self.poster = movie.poster
        self.boxOffice = movie.boxOffice
    }
    
    var movie: Movie {
        Movie(title: title, year: year, imdbID: imdbID, poster: poster, boxOffice: boxOffice)
    }
}
