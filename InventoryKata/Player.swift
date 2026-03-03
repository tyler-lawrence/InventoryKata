//
//  Player.swift
//  InventoryKata
//
//  Created by Tyler Lawrence on 3/2/26.
//

import Foundation

struct Player {
    let name: String
    var inventory: Inventory = Inventory()

    mutating func pickUpItem(_ itemType: ItemType) {
        inventory.add(itemType)
    }
}
