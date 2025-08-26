//
//  ContentView.swift
//  TicTacToe
//
//  Created by Jason Bell on 8/26/25.
//

import SwiftUI

struct ContentView: View {
    @State private var game = Game()
    
    var body: some View {
        VStack {
            HStack {
                BoardSquare(game: game, pos: 0)
                BoardSquare(game: game, pos: 1)
                BoardSquare(game: game, pos: 2)
            }
            HStack {
                BoardSquare(game: game, pos: 3)
                BoardSquare(game: game, pos: 4)
                BoardSquare(game: game, pos: 5)
            }
            HStack {
                BoardSquare(game: game, pos: 6)
                BoardSquare(game: game, pos: 7)
                BoardSquare(game: game, pos: 8)
            }
        }
        .font(.custom("Poppins-Bold", size: 84))
        .padding()
        Text("Winner: \(game.winner.text)")
        Button("New Game") {
            game.reset()
        }
    }
}

#Preview {
    ContentView()
}

struct BoardSquare: View {
    var game: Game
    var pos: Int
    
    var body: some View {
        Button(game.board.positions[self.pos].text) {
            try? game.makeMove(self.pos)
        }
        .frame(width: 84, height: 84)
        .border(Color.black, width: 4)
    }
}
