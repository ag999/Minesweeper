//
//  Square.swift
//  Minesweeper
//
//  Created by Adit Gupta on 03/12/15.
//  Copyright © 2015 Adit Gupta and Rohit Khanwani. All rights reserved.
//

import Foundation

class Square {
    
    let r:Int
    let c:Int
    // give these default values that we will re-assign later with each new game
    var noNearbyMines = 0
    var isMineLocation = false
    var isRevealed = false
    
    init(r:Int, c:Int) {
        //store the r and cumn of the square in the grid
        self.r = r
        self.c = c
    }
}