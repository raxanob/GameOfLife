//
//  GameViewController.swift
//  GameLife
//
//  Created by Rayane Xavier on 31/10/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    let scene = GameScene()
    
    override func viewDidLoad() {

    // retrieve the SCNView
    let scnView = self.view as! SCNView
    
    // set the scene to the view
    scnView.scene = scene
    scnView.pointOfView?.position = SCNVector3Make(0, 0, 0)

    // allows the user to manipulate the camera
    scnView.allowsCameraControl = true

    // show statistics such as fps and timing information
    scnView.showsStatistics = true

    // configure the view
     scnView.backgroundColor = UIColor.black
        
    // create and add a camera to the scene
    let cameraNode = SCNNode()
    cameraNode.camera = SCNCamera()
    scene.rootNode.addChildNode(cameraNode)
            
    // place the camera
        cameraNode.position = SCNVector3(x: 0, y: -30, z: 10)
        cameraNode.look(at: SCNVector3 (0, 0, 0))
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        scene.touchedScreen()
    }
}
