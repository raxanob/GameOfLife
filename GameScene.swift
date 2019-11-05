//
//  GameScene.swift
//  GameLife
//
//  Created by Rayane Xavier on 31/10/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//


import SceneKit

public class GameScene: SCNScene {
    
    let deadColor = UIColor.systemGray5
    let aliveColor = UIColor.systemRed
    var grid = Grid()
    let rules = RulesGame()
    var nodes: [SCNNode] = []
    
    override public init() {
        super.init()
        
        grid.matrix[5][5].isAlive = 1
        grid.matrix[6][6].isAlive = 1
        grid.matrix[7][6].isAlive = 1
        grid.matrix[7][5].isAlive = 1
        grid.matrix[7][4].isAlive = 1

        drowGrid()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func drowGrid() {
        
        let offset: Int = 40
        let rows = grid.matrix.count
        let primeiraLinha = grid.matrix[0]
        let cols = primeiraLinha.count
        
        for i in 0..<rows {
            var str: String = ""
            for j in 0..<cols {
                str.append("\(grid.matrix[i][j].isAlive)")
                let boxGeometry = SCNBox(width: 0.6, height: 0.6, length: 0.6, chamferRadius: 0.05)
                let boxCopy = SCNNode(geometry: boxGeometry)

                if grid.matrix[i][j].isAlive == 1 {
                    boxCopy.geometry?.firstMaterial?.diffuse.contents = aliveColor
                } else {
                    boxCopy.geometry?.firstMaterial?.diffuse.contents = deadColor
                }

                boxCopy.position.x = Float(i - offset)
                boxCopy.position.y = Float(j - offset)
                nodes.append(boxCopy)
                self.rootNode.addChildNode(boxCopy)

            }
            print(str)
        }
    }
    
    func touchedScreen() {
        for i in 0..<nodes.count{
            nodes[i].removeFromParentNode()
        }
        nodes = []
        grid = rules.step(grid: grid)
        drowGrid()
    }
    
}
