//
//  Grid.swift
//  GameLife
//
//  Created by Rayane Xavier on 01/11/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import SceneKit

class Grid {
    
    var matrix: [[CubeCell]] = []
    
    init() {
        let x = 15
        let y = 10
        
        for i in 0...x-1 { // percorrendo todas as linhas
            // crirar nova linha
            var singleRow = [CubeCell]()
            for j in 0...y-1 { // percorrendo todas as colunas
                singleRow.append(CubeCell(x: j, y: i))
            }
            // colocar nova linha na matrix
            matrix.append(singleRow)
        }
    }
}
