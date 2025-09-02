//
//  FavoritesView.swift
//  MovieSearch
//
//  Created by Jason Bell on 8/29/25.
//

import SwiftUI

struct FavoritesView: View {
    let movieRepository: any MovieRepository
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(movieRepository.favorites) { movie in
                    NavigationLink {
                        MovieDetailView(movie: movie)
                    } label: {
                        MovieFavoriteView(movie: movie, removeFavoriteFunction: {
                            movieRepository.removeFavorite($0)
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    FavoritesView(movieRepository: MovieStatic())
}

struct MovieFavoriteView: View {
    let movie: Movie
    let removeFavoriteFunction: (Movie) -> Void
    
    var body: some View {
        HStack {
            AsyncImage(url: movie.poster, scale: 0.1) { img in
                img
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            } placeholder: {
                Image(systemName: "photo")
            }
            
            Text("\(movie.title) (\(movie.year))")
        }
        .swipeActions(edge: .trailing) {
            Button(role: .destructive) {
                removeFavoriteFunction(movie)
            } label: {
                Image(systemName: "trash.fill")
            }
        }
    }
}
