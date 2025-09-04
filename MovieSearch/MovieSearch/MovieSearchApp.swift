//
//  MovieSearchApp.swift
//  MovieSearch
//
//  Created by Jason Bell on 8/29/25.
//

import SwiftUI
import SwiftData

@main
struct MovieSearchApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Favorite.self])
        }
    }
}
