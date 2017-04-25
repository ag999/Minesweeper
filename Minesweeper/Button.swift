//
//  Button.swift
//  Minesweeper
//
//  Created by Adit Gupta on 03/12/15.
//  Copyright © 2015 Adit Gupta and Rohit Khanwani. All rights reserved.
//

import Foundation

import UIKit

class Button : UIButton {
    let sizeTile:CGFloat
    var tile:Tile
    
    init(squareModel:Tile, sizeTile:CGFloat) {
        self.tile = squareModel
        self.sizeTile = sizeTile
        
        let x = CGFloat(self.tile.c) * sizeTile
        let y = CGFloat(self.tile.r) * sizeTile
        let squareFrame = CGRectMake(x, y, sizeTile, sizeTile)
        
        super.init(frame: squareFrame)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getLabelText() -> String {
        // check the isMineLocation and noNearbyMines properties to determine the text to display
        if !self.tile.isMineLocation {
            if self.tile.noNearbyMines == 0 {
                // case 1: there's no mine and no neighboring mines
                return ""
            }else {
                // case 2: there's no mine but there are neighboring mines
                return "\(self.tile.noNearbyMines)"
            }
        }
        // case 3: there's a mine
        return "💥"
    }
    
}