//
//  Score.swift
//  Memorize
//
//  Created by Bruno Cardoso Ambrosio on 03/07/20.
//

import Foundation

struct Score {
    
    private(set) var value: Int = 0
    
    mutating func increaseScore() {
        value += 2
    }
    
    mutating func scorePenalty() {
        value += -1
    }
}
