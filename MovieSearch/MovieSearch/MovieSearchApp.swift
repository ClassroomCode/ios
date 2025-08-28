//
//  MovieSearchApp.swift
//  MovieSearch
//
//  Created by Jason Bell on 8/28/25.
//

import SwiftUI

@main
struct MovieSearchApp: App {
    let movieDb = MovieDb()
    
    var body: some Scene {
        WindowGroup {
            ContentView(movieDb: movieDb)
        }
    }
}
