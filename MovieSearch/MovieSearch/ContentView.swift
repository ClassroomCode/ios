//
//  ContentView.swift
//  MovieSearch
//
//  Created by Jason Bell on 8/28/25.
//

import SwiftUI

struct ContentView: View {
    var movieDb: MovieDb
    @State private var movies: [Movie] = []
    
    var body: some View {
        VStack {
            Button("Fetch") {
                movies = movieDb.getMovies()
            }
            List {
                ForEach($movies) { $movie in
                    MovieView(movie: $movie)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView(movieDb: MovieDb())
}

struct MovieView: View {
    @Binding var movie: Movie
    
    var body: some View {
        TextField("Edit", text:$movie.title)
    }
}
