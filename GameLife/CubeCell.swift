//
//  CubeCell.swift
//  GameLife
//
//  Created by Rayane Xavier on 01/11/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import SceneKit

class CubeCell {
    
    
    var x: Int
    var y: Int
    
    var isAlive: Int = 0
    
    init(x: Int, y: Int, isAlive: Int = 0){

        self.x = x
        self.y = y
        self.isAlive = isAlive
        
    }
    

}
