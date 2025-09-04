//
//  FavoritesView.swift
//  MovieSearch
//
//  Created by Jason Bell on 8/29/25.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var favorites: [Favorite]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(favorites) { favorite in
                    NavigationLink {
                        MovieDetailView(movie: favorite.movie)
                    } label: {
                        MovieFavoriteView(favorite: favorite)
                    }
                }
            }
            .navigationTitle(Text("Favorites"))
        }
    }
}

#Preview {
    FavoritesView()
        .modelContainer(for: [Favorite.self], inMemory: true)
}

struct MovieFavoriteView: View {
    @Environment(\.modelContext) private var modelContext
    let favorite: Favorite
    
    var body: some View {
        HStack {
            AsyncImage(url: favorite.poster, scale: 0.1) { img in
                img
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            } placeholder: {
                Image(systemName: "photo")
            }
            
            Text("\(favorite.title) (\(favorite.year))")
        }
        .swipeActions(edge: .trailing) {
            Button(role: .destructive) {
                modelContext.delete(favorite)
            } label: {
                Image(systemName: "trash.fill")
            }
        }
    }
}
