//
//  Pool.swift
//  GameLife
//
//  Created by Rayane Xavier on 06/11/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import SceneKit

class Pool {
    
    // array de cubeCells
    var cubes: [SCNNode] = []
    var ncubes: Int = 200
    let boxGeometry = SCNBox(width: 0.6, height: 0.6, length: 0.6, chamferRadius: 0.05)
    
    // init recebe um tamanho (Int)
    init(cubes: Int) {
    // preenche o array com esse número de cubeCells
        for i in 0..<ncubes{
            let boxCopy = SCNNode(geometry: boxGeometry)
            self.cubes.append(boxCopy)
        }
    }
//    
//    // método para buscar um cubeCell
//    func 
}
