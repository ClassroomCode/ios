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
}
