//
//  Game.swift
//  InventoryKata
//
//  Created by Tyler Lawrence on 3/3/26.
//

import Foundation

class Game {
    private(set) var currentStage: Stage = .town

    func go(to stage: Stage) {
        currentStage = stage
    }
}
