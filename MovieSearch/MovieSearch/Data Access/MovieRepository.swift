//
//  MovieRepository.swift
//  MovieSearch
//
//  Created by Jason Bell on 8/29/25.
//

import Foundation

protocol MovieRepository
{
    func search(q: String) async -> [Movie]
    
    var favorites: [Movie] { get }
    
    func addFavorite(_ movie: Movie)
    func removeFavorite(_ movie: Movie)
}
