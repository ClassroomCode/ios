//
//  ContentView.swift
//  MovieSearch
//
//  Created by Jason Bell on 8/29/25.
//

import SwiftUI

struct ContentView: View {
    @State var movieRepository: any MovieRepository = MovieAPI()

    var body: some View {
        TabView {
            Tab("Movies", systemImage: "film.fill") {
                SearchView(movieRepository: movieRepository)
            }
            Tab("Favorites", systemImage: "star.fill") {
                FavoritesView()
            }
        }
    }
}

#Preview {
    ContentView(movieRepository: MovieStatic())
}
