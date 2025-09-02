//
//  SearchView.swift
//  MovieSearch
//
//  Created by Jason Bell on 8/29/25.
//

import SwiftUI

struct SearchView: View {
    let movieRepository: any MovieRepository
    @State var searchResults: [Movie] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchBoxView(searchFunction: {
                    self.searchResults = await movieRepository.search(q: $0)
                })
                .padding()
                
                List {
                    ForEach(searchResults) { movie in
                        NavigationLink {
                            MovieDetailView(movie: movie)
                        } label: {
                            MovieResultView(movie: movie, addFavoriteFunction: {
                                movieRepository.addFavorite($0)
                            })
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SearchView(movieRepository: MovieStatic())
}

struct SearchBoxView: View {
    let searchFunction: (String) async -> ()
    @State var searchText = ""
    
    var body: some View {
        HStack {
            TextField("Search Text", text: $searchText)
            Button(action: {
                Task { await searchFunction(searchText) }
            }, label: {
                Image(systemName: "magnifyingglass")
            })
        }
    }
}

struct MovieResultView: View {
    let movie: Movie
    let addFavoriteFunction: (Movie) -> Void
    
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
        .swipeActions(edge: .leading) {
            Button() {
                addFavoriteFunction(movie)
            } label: {
                Image(systemName: "star.fill")
            }
            .tint(.yellow)
        }
    }
}
