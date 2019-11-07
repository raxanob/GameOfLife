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
    let nRow = 50
    let nCols = 50
    
    init() {
        for i in 0...nRow-1 { // percorrendo todas as linhas
            // crirar nova linha
            var singleRow = [CubeCell]()
            for j in 0...nCols-1 { // percorrendo todas as colunas
                singleRow.append(CubeCell(x: j, y: i))
            }
            // colocar nova linha na matrix
            matrix.append(singleRow)
        }
    }
    
    func getCell (x: Int, y: Int) -> CubeCell?{
        if x >= nCols || x < 0 || y >= nRow || y < 0{
            return nil
        } else {
            return matrix[y][x]
        }
    }
    
    func getLiveNeighbourds(cell: CubeCell) -> Int {
        var count = 0
        for m in -1...1 {
            for n in -1...1 {
                if let cell = getCell(x: cell.x + m, y: cell.y + n){
                    if cell.isAlive == 1{
                        count += 1
                    }
                }
            }
        }
        return count
    }
}
