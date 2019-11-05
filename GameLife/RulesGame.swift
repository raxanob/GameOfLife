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
            
    override init() {
        super.init()
    }
    
    func step(grid: Grid) -> Grid {
        let grid2 = Grid()
        
        for row in 0..<grid.matrix.count {
            for col in 0..<grid.matrix[0].count {
                if grid.matrix[row][col].isAlive == 0 {
                    let count = grid.getLiveNeighbourds(cell: grid.matrix[row][col])
                    if count == 3 {
                        grid2.matrix[row][col].isAlive = 1
                    } else {
                        grid2.matrix[row][col].isAlive = 0
                    }
                } else {
                    let count = grid.getLiveNeighbourds(cell: grid.matrix[row][col]) - 1
                    if count < 2 || count > 3 {
                        grid2.matrix[row][col].isAlive = 0
                    } else {
                        grid2.matrix[row][col].isAlive = 1
                    }
                }
            }
        }
        return grid2
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
