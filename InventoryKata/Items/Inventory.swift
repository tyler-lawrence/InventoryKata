//
//  Inventory.swift
//  InventoryKata
//
//  Created by Tyler Lawrence on 3/2/26.
//

import Foundation

struct Inventory {
    typealias itemID = String
    //TODO: currently there can not be two swords but swords don't stack
    private(set) var items: [itemID: ItemStack] = [:]
    let maxWeight: Int = 50
    var totalWeight: Int {
        items.values.reduce(0) { $0 + $1.totalWeight }
    }

    mutating func add(_ itemType: ItemType, quantity: Int = 1) {
        if itemType.isStackable {
            addItemToStack(itemType: itemType, quantity: quantity)
        } else {
            items[itemType.id] = ItemStack(itemType: itemType, quantity: quantity)
        }
    }

    private mutating func addItemToStack(itemType: ItemType, quantity: Int) {
        if let _ = items[itemType.id] {
            items[itemType.id]!.add(amount: quantity)
        }
    }
}
