//
//  MovieDetailView.swift
//  MovieSearch
//
//  Created by Jason Bell on 8/29/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            Text("\(movie.title) (\(movie.year))")
            AsyncImage(url: movie.poster) { img in
                img
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "photo")
            }
        }
    }
}

#Preview {
    MovieDetailView(movie: MovieStatic.sampleMovie)
}
