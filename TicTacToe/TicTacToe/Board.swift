//
//  Board.swift
//  TicTacToe
//
//  Created by Jason Bell on 8/26/25.
//

import Foundation

struct Board {
    var positions: [Piece]  // 9 of them
    
    init() {
        self.positions = [Piece]()
        for _ in 0...8 {
            self.positions.append(.empty)
        }
    }
    
    var isEmpty: Bool {
        positions.allSatisfy { p in p == .empty }
    }
    
    var isFull: Bool {
        positions.allSatisfy { p in p != .empty }
    }
    
    var emptyPositions: [Int] {
        var retVal = [Int]()
        for i in 0...8 {
            if positions[i] == .empty {
                retVal.append(i)
            }
        }
        return retVal
    }
}
