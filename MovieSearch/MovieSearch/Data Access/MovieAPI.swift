//
//  MovieAPI.swift
//  MovieSearch
//
//  Created by Jason Bell on 8/29/25.
//

import Foundation

@Observable
class MovieAPI : MovieRepository
{
    private let baseUrl = "https://www.omdbapi.com/?apikey=838fd3e1&s="
    private var _favorites: Set<Movie> = []
    
    func search(q: String) async -> [Movie]
    {
        guard let searchURL = URL(string: "\(baseUrl)\(q)") else { return [] }
        guard let results = await searchURL.fetch(type: SearchResults.self) else { return [] }
        return results.movies
    }
    
    var favorites: [Movie] {
        Array(_favorites)
    }
    
    func addFavorite(_ movie: Movie) {
        _favorites.insert(movie)
    }
    
    func removeFavorite(_ movie: Movie) {
        _favorites.remove(movie)
    }
    
    struct SearchResults : Codable {
        var movies = [Movie]()
        var totalResults = ""
        
        enum CodingKeys : String, CodingKey {
            case movies = "Search"
            case totalResults
        }
    }
}

extension URL {
    func fetchData() async -> Data? {
        try? await URLSession.shared.data(from: self).0
    }
    
    func fetch<T:Codable>(type : T.Type) async -> T? {
        guard let data = await fetchData() else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
