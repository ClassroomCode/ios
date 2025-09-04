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
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults) { movie in
                    NavigationLink {
                        MovieDetailView(movie: movie)
                    } label: {
                        MovieResultView(movie: movie)
                    }
                }
            }
            .searchable(text: $searchText)
            .task(id: searchText) {
                guard searchText.count > 2 else {
                    self.searchResults = []
                    return
                }
                try? await Task.sleep(for: .seconds(3))
                guard !Task.isCancelled else { return }
                
                self.searchResults = await movieRepository.search(q: searchText)
            }
            .navigationTitle(Text("Search"))
        }
    }
}

#Preview {
    SearchView(movieRepository: MovieStatic())
        .modelContainer(for: [Favorite.self], inMemory: true)
}

struct MovieResultView: View {
    @Environment(\.modelContext) private var modelContext
    let movie: Movie
    
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
                modelContext.insert(Favorite(movie: movie))
            } label: {
                Image(systemName: "star.fill")
            }
            .tint(.yellow)
        }
    }
}
