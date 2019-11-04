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

    override func viewDidLoad() {
    
        let scene = GameScene()

    // retrieve the SCNView
    let scnView = self.view as! SCNView

    // set the scene to the view
    scnView.scene = scene
    scnView.pointOfView?.position = SCNVector3Make(0, 0, 100)

    // allows the user to manipulate the camera
    scnView.allowsCameraControl = true

    // show statistics such as fps and timing information
    scnView.showsStatistics = true

    // configure the view
     scnView.backgroundColor = UIColor.white

    }
    
    func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // check what nodes are tapped
        let p = gestureRecognize.location(in: scnView)
        let hitResults = scnView.hitTest(p, options: [:])
        
        // check that we clicked on at least one object
        if hitResults.count > 0 {
           
            // retrieved the first clicked object
            let result = hitResults[0]
            
        }
    }
}
