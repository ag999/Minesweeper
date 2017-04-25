//
//  Board.swift
//  Minesweeper
//
//  Created by Adit Gupta on 03/12/15.
//  Copyright © 2015 Adit Gupta and Rohit Khanwani. All rights reserved.
//

import Foundation

class Board {
    
    let size:Int
    var squares:[[Square]] = [] // a 2d array of square cells, indexed by [r][cumn]
    
    
    init(size:Int) {
        self.size = size
        var r:Int=0
        while r < size {
            var squarer:[Square] = []
            for c in 0 ..< size {
                let square = Square(r: r, c: c)
                squarer.append(square)
                
            }
            squares.append(squarer)
            r = r + 1
        }
    }
    
    func resetGame() {
        // assign mines to squares
        var r:Int=0
        while r < size {
            for c in 0 ..< size {
                squares[r][c].isRevealed = false
                self.calculateMineLocation(squares[r][c])
            }
            r = r + 1
        }
        
        // count number of neighboring squares
        r = 0
        while r < size {
            for c in 0 ..< size {
        ////
                self.minesNearby(squares[r][c])
            }
            r = r + 1
        }
    }
    
    func calculateMineLocation(square: Square) {
        square.isMineLocation = ((arc4random()%8) == 0)
    }
    
    func minesNearby(square : Square) {
        // first get a list of adjacent squares
        let nearby = nearbySquares(square)
        var noNearbyMines = 0
        
        // for each neighbor with a mine, add 1 to this square's count
        for x in nearby {
            if x.isMineLocation {
                noNearbyMines = noNearbyMines + 1
            }
        }
        square.noNearbyMines = noNearbyMines
    }
    
    func nearbySquares(square : Square) -> [Square] {
        var noNearby:[Square] = []
        
        // an array of tuples containing the relative position of each neighbor to the square
        let adjacentOffsets =
        [(-1,0),(1,0),(-1,1),(0,1),(1,1),(-1,-1),(0,-1),(1,-1)]
        
        for (rOffset,cOffset) in adjacentOffsets {
            // tileLocation might return a Square, or it might return nil, so use the optional datatype "?"
            let optionalNearby:Square? = tileLocation(square.r+rOffset, c: square.c+cOffset)
            // only evaluates true if the optional tile isn't nil
            if let nearby = optionalNearby {
                noNearby.append(nearby)
            }
        }
        return noNearby
    }
    
    func tileLocation(r : Int, c : Int) -> Square? {
        if r >= 0 && r < self.size && c >= 0 && c < self.size {
            return squares[r][c]
        } else {
            return nil
        }
    }
    
    
}