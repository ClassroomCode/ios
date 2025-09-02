//
//  Movie.swift
//  MovieSearch
//
//  Created by Jason Bell on 8/29/25.
//

import Foundation

struct Movie : Codable, Identifiable, Hashable {
    var id : String { imdbID }
    var title: String
    var year = ""
    var imdbID = ""
    var poster : URL?
    var boxOffice: String?
    
    enum CodingKeys : String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case poster = "Poster"
    }
}
