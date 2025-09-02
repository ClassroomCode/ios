//
//  MovieStatic.swift
//  MovieSearch
//
//  Created by Jason Bell on 8/29/25.
//

import Foundation

@Observable
class MovieStatic : MovieRepository
{
    private var _favorites: Set<Movie> = []
    
    func search(q: String) async -> [Movie]
    {
        return [
            Movie(title: "Star Wars: Episode IV - A New Hope", year: "1977", imdbID: "tt0076759", poster: URL(string: "https://m.media-amazon.com/images/M/MV5BOGUwMDk0Y2MtNjBlNi00NmRiLTk2MWYtMGMyMDlhYmI4ZDBjXkEyXkFqcGc@._V1_SX300.jpg")),
            Movie(title: "Star Wars: Episode V - The Empire Strikes Back", year: "1980", imdbID: "tt0080684", poster: URL(string: "https://m.media-amazon.com/images/M/MV5BMTkxNGFlNDktZmJkNC00MDdhLTg0MTEtZjZiYWI3MGE5NWIwXkEyXkFqcGc@._V1_SX300.jpg")),
            Movie(title: "Star Wars: Episode VI - Return of the Jedi", year: "1983", imdbID: "tt0086190", poster: URL(string: "https://m.media-amazon.com/images/M/MV5BNWEwOTI0MmUtMGNmNy00ODViLTlkZDQtZTg1YmQ3MDgyNTUzXkEyXkFqcGc@._V1_SX300.jpg"))
            
        ];
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
    
    static let sampleMovie = Movie(title: "Star Wars: Episode IV - A New Hope", year: "1977", imdbID: "tt0076759", poster: URL(string: "https://m.media-amazon.com/images/M/MV5BOGUwMDk0Y2MtNjBlNi00NmRiLTk2MWYtMGMyMDlhYmI4ZDBjXkEyXkFqcGc@._V1_SX300.jpg"));
}
