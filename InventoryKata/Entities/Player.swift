//
//  Player.swift
//  InventoryKata
//
//  Created by Tyler Lawrence on 3/2/26.
//

import Foundation

struct Player: MarketPlayer {
    let name: String
    var inventory: Inventory = Inventory()
    var money: Decimal = 100
}
