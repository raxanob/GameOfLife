//
//  GameScene.swift
//  GameLife
//
//  Created by Rayane Xavier on 31/10/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import SceneKit

public class GameScene: SCNScene, SCNSceneRendererDelegate {
    
    var grid = Grid()
    let rules = RulesGame()
    
    let boxGeometry = SCNBox(width: 0.9, height: 0.9, length: 0.9, chamferRadius: 0.5)
    var aliveColor = UIColor.white {
        didSet {
            boxGeometry.firstMaterial?.diffuse.contents = aliveColor
        }
    }
    
    let offset: Int = 7
    
    var nodes: [SCNNode] = []
    
    var z: Float = 0
    let cameraNode = SCNNode()
    let lightNode = SCNNode()
    let ambientLightNode = SCNNode()

    
    override public init() {
        super.init()
        setupScene()
            
        //1
        grid.matrix[3][1].isAlive = 1
        grid.matrix[4][1].isAlive = 1
        grid.matrix[5][1].isAlive = 1
        
        grid.matrix[1][3].isAlive = 1
        grid.matrix[1][4].isAlive = 1
        grid.matrix[1][5].isAlive = 1
        
        grid.matrix[6][3].isAlive = 1
        grid.matrix[6][4].isAlive = 1
        grid.matrix[6][5].isAlive = 1
        
        grid.matrix[3][6].isAlive = 1
        grid.matrix[4][6].isAlive = 1
        grid.matrix[5][6].isAlive = 1
        
        //2
        grid.matrix[9][1].isAlive = 1
        grid.matrix[10][1].isAlive = 1
        grid.matrix[11][1].isAlive = 1
        
        grid.matrix[8][3].isAlive = 1
        grid.matrix[8][4].isAlive = 1
        grid.matrix[8][5].isAlive = 1
        
        grid.matrix[13][3].isAlive = 1
        grid.matrix[13][4].isAlive = 1
        grid.matrix[13][5].isAlive = 1
        
        grid.matrix[9][6].isAlive = 1
        grid.matrix[10][6].isAlive = 1
        grid.matrix[11][6].isAlive = 1
        
        //3
        grid.matrix[3][8].isAlive = 1
        grid.matrix[4][8].isAlive = 1
        grid.matrix[5][8].isAlive = 1
        
        grid.matrix[1][9].isAlive = 1
        grid.matrix[1][10].isAlive = 1
        grid.matrix[1][11].isAlive = 1
        
        grid.matrix[6][9].isAlive = 1
        grid.matrix[6][10].isAlive = 1
        grid.matrix[6][11].isAlive = 1
        
        grid.matrix[3][13].isAlive = 1
        grid.matrix[4][13].isAlive = 1
        grid.matrix[5][13].isAlive = 1
        
        //4
        grid.matrix[9][8].isAlive = 1
        grid.matrix[10][8].isAlive = 1
        grid.matrix[11][8].isAlive = 1
        
        grid.matrix[8][9].isAlive = 1
        grid.matrix[8][10].isAlive = 1
        grid.matrix[8][11].isAlive = 1
        
        grid.matrix[13][9].isAlive = 1
        grid.matrix[13][10].isAlive = 1
        grid.matrix[13][11].isAlive = 1
        
        grid.matrix[9][13].isAlive = 1
        grid.matrix[10][13].isAlive = 1
        grid.matrix[11][13].isAlive = 1

        drawGrid()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func drawGrid() {
        
        let rows = grid.matrix.count
        let primeiraLinha = grid.matrix[0]
        let cols = primeiraLinha.count
        
        for i in 0..<rows {
            for j in 0..<cols {

                if grid.matrix[i][j].isAlive == 1 {
                    let boxCopy = SCNNode(geometry: boxGeometry)
                    boxCopy.position.x = Float(i - offset)
                    boxCopy.position.y = Float(j - offset)
                    boxCopy.position.z = z
                    nodes.append(boxCopy)
                    self.rootNode.addChildNode(boxCopy)
                }
            }
        }
    }
    
    func reload() {
        z += 1
        cameraNode.position.z += 1
        lightNode.position.z += 1
        ambientLightNode.position.z += 1
        grid = rules.step(grid: grid)
        drawGrid()
    }
    
    let interval: TimeInterval = 0.1
    var nextTime: TimeInterval = 0
    var contador: CGFloat = 0
    public func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if nextTime < time {
        reload()
        nextTime = time + interval
            aliveColor = UIColor(hue: contador, saturation: 1, brightness: 1, alpha: 0.6)
            if contador < 1 {
                contador += 0.02
            } else {
                contador = 0
            }
            
        }
    }
    
    func setupScene(){
        // create and add a camera to the scene
        
        cameraNode.camera = SCNCamera()
                
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: -25, z: 25)
        cameraNode.look(at: SCNVector3 (0, 0, 0))
        self.rootNode.addChildNode(cameraNode)
            
        // create and add a light to the scene
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 20, z: 20)
        self.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.systemGray2
        self.rootNode.addChildNode(ambientLightNode)
    }
    
}
