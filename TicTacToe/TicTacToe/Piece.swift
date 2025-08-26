//
//  Piece.swift
//  TicTacToe
//
//  Created by Jason Bell on 8/26/25.
//

import Foundation

enum Piece {
    case empty, x, o
    
    var text: String {
        switch self {
        case .empty:
            " "
        case .x:
            "X"
        case .o:
            "O"
        }
    }
}
