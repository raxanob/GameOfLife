//
//  GameScene.swift
//  GameLife
//
//  Created by Rayane Xavier on 31/10/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//


import SceneKit

public class GameScene: SCNScene, SCNSceneRendererDelegate {
    
    let deadColor = UIColor.systemGray5
    let aliveColor = UIColor.systemRed
    var grid = Grid()
    let rules = RulesGame()
    var nodes: [SCNNode] = []
    var z: Float = 0
    let cameraNode = SCNNode()
    let boxGeometry = SCNBox(width: 0.6, height: 0.6, length: 0.6, chamferRadius: 0.05)
    
    override public init() {
        super.init()
        setupScene()
        self.boxGeometry.firstMaterial?.diffuse.contents = aliveColor
        
        grid.matrix[3][3].isAlive = 1
        grid.matrix[4][2].isAlive = 1
        grid.matrix[4][3].isAlive = 1
        grid.matrix[5][4].isAlive = 1



        drawGrid()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func drawGrid() {
        
        let offset: Int = 4
        let rows = grid.matrix.count
        let primeiraLinha = grid.matrix[0]
        let cols = primeiraLinha.count
        
        for i in 0..<rows {
            var str: String = ""
            for j in 0..<cols {
                str.append("\(grid.matrix[i][j].isAlive)")

                if grid.matrix[i][j].isAlive == 1 {
                    let boxCopy = SCNNode(geometry: boxGeometry)
                    boxCopy.position.x = Float(i - offset)
                    boxCopy.position.y = Float(j - offset)
                    boxCopy.position.z = z
                    nodes.append(boxCopy)
                    self.rootNode.addChildNode(boxCopy)
                }
            }
            print(str)
        }
    }
    
    func reload() {
        z += 1
        cameraNode.position.z += 1
        grid = rules.step(grid: grid)
        drawGrid()
    }
    
    let interval: TimeInterval = 0.1
    var nextTime: TimeInterval = 0
    public func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if nextTime < time {
        reload()
        nextTime = time + interval
        }
    }
    
    func setupScene(){
        // create and add a camera to the scene
        
        cameraNode.camera = SCNCamera()
                
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: -40, z: 10)
        cameraNode.look(at: SCNVector3 (0, 0, 0))
        self.rootNode.addChildNode(cameraNode)
            
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 20, z: 20)
        self.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.darkGray
        self.rootNode.addChildNode(ambientLightNode)
    }
    
}
