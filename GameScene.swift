//
//  GameScene.swift
//  GameLife
//
//  Created by Rayane Xavier on 31/10/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//


import SceneKit

class GameScene: SCNScene {

    override init() {
        super.init()

        let geometry = SCNBox(width: 0.8, height: 0.8,
                                   length: 0.01, chamferRadius: 0.005)
            
        geometry.firstMaterial?.diffuse.contents = UIColor.cyan

        let boxnode = SCNNode(geometry: geometry)
        let offset: Int = 1
        
        let x = Int(UIScreen.main.bounds.width/10)
        let y = Int(UIScreen.main.bounds.height/10)
        
        for xIndex:Int in 0...x {
            for yIndex:Int in 0...y {
                let boxCopy = boxnode.copy() as! SCNNode
                boxCopy.position.x = Float(xIndex - offset)
                boxCopy.position.y = Float(yIndex - offset)
                self.rootNode.addChildNode(boxCopy)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
