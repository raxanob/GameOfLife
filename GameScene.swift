//
//  GameScene.swift
//  GameLife
//
//  Created by Rayane Xavier on 31/10/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//


import SceneKit

public class GameScene: SCNScene {
    
    let boxGeometry = SCNBox(width: 0.8, height: 0.8, length: 0.8, chamferRadius: 0.05)

//    override init() {
//        super.init()
//
//        boxGeometry.firstMaterial?.diffuse.contents = UIColor.cyan
//
//        let boxNode = SCNNode(geometry: boxGeometry)
//        let offset: Int = 20
//
//        boxNode.position.z = 0
//
//        let x = Int(UIScreen.main.bounds.width/20)
//        let y = Int(UIScreen.main.bounds.height/20)
//
//        for xIndex:Int in 0...x {
//            for yIndex:Int in 0...y {
//                let boxCopy = boxNode.copy() as! SCNNode
//                boxCopy.position.x = Float(xIndex - offset)
//                boxCopy.position.y = Float(yIndex - offset)
//                self.rootNode.addChildNode(boxCopy)
//            }
//        }
//    }
    
    
    override public init() {
        super.init()
        
        let grid = Grid()
        
        grid.matrix[1][3].isAlive = 1
        grid.matrix[2][2].isAlive = 1
        grid.matrix[2][3].isAlive = 1
        grid.matrix[3][3].isAlive = 1
        grid.matrix[3][4].isAlive = 1
        
        let rows = grid.matrix.count
        
        let primeiraLinha = grid.matrix[0]
        let cols = primeiraLinha.count
        
        for i in 0..<rows {
            var str: String = ""
            for j in 0..<cols {
                str.append("\(grid.matrix[i][j].isAlive)")
//                str.append("(\(grid.matrix[i][j].x), \(grid.matrix[i][j].y))")
            }
            print(str)
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    
    
}
