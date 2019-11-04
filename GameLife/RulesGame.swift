//
//  RulesGame.swift
//  GameLife
//
//  Created by Rayane Xavier on 01/11/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import UIKit
import SceneKit

class RulesGame: SCNScene {
    
    var callCell:[[CubeCell]] = []
    
    override init() {
        super.init()
        
        step(grid: Grid())
    }
    
    func step(grid: Grid) {
        
        for row in callCell {
            for cell in row {
                if cell.isAlive == 0 {
                    let count = grid.getLiveNeighbourds(cell: cell) - 1
                    if count == 3 {
                        cell.isAlive = 1
                    }
                } else {
                    let count = grid.getLiveNeighbourds(cell: cell)
                    if count < 2 && count > 3 {
                        cell.isAlive = 0
                    }
                }
            }
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
