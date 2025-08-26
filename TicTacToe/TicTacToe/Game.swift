//
//  Game.swift
//  TicTacToe
//
//  Created by Jason Bell on 8/26/25.
//

import Foundation

@Observable
class Game {
    var board = Board()
    var player = Piece.x
    
    func reset() {
        board = Board()
        player = Piece.x
    }
    
    func makeMove(_ pos: Int) throws {
        guard board.positions[pos] == .empty else { throw GameError.PositionTaken }
        board.positions[pos] = player
        self.player = (player == .x ? .o : .x)
    }
     
    func makeComputerMove() {
        let openPositions = board.emptyPositions
        let pos = Int.random(in: 0..<openPositions.count)
        try? makeMove(openPositions[pos])
    }
    
    var isTie: Bool {
        (winner == .empty && board.isFull)
    }
    
    var winner: Piece {
        // 0, 1, 2
        // 3, 4, 5
        // 6, 7, 8
        
        if isWin(0, 1, 2) { return board.positions[0] }
        if isWin(3, 4, 5) { return board.positions[3] }
        if isWin(6, 7, 8) { return board.positions[6] }
        if isWin(0, 3, 6) { return board.positions[0] }
        if isWin(1, 4, 7) { return board.positions[1] }
        if isWin(2, 5, 8) { return board.positions[2] }
        if isWin(0, 4, 8) { return board.positions[0] }
        if isWin(2, 4, 6) { return board.positions[2] }
        
        return .empty
    }
    
    private func isWin(_ p1: Int, _ p2: Int, _ p3: Int) -> Bool {
        guard board.positions[p1] != .empty else { return false }
        return board.positions[p1] == board.positions[p2] && board.positions[p2] == board.positions[p3]
    }
}

enum GameError : Error {
    case PositionTaken
}
