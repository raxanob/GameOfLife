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
        scnView.delegate = scene
        scnView.loops = true
        scnView.isPlaying = true
            
        // set the scene to the view
        scnView.scene = scene
        scnView.pointOfView = scene.cameraNode

        // allows the user to manipulate the camera
        scnView.allowsCameraControl = false

        // show statistics such as fps and timing information
        scnView.showsStatistics = false

        // configure the view
         scnView.backgroundColor = UIColor.black

        }
        
    }
