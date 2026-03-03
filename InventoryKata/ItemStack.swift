//
//  ItemStack.swift
//  InventoryKata
//
//  Created by Tyler Lawrence on 3/2/26.
//

import Foundation

struct ItemStack {
    private(set) var itemType: ItemType
    private(set) var quantity: Int
    var totalWeight: Int {
        itemType.weight * quantity
    }

    mutating func add(amount: Int = 1) {
        guard itemType.isStackable else {
            return
        }
        quantity += amount
    }

    mutating func remove(amount: Int = 1) {
        guard itemType.isStackable, amount <= quantity else {
            return
        }
        quantity -= amount
    }
}
