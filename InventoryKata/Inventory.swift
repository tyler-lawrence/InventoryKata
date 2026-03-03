//
//  Inventory.swift
//  InventoryKata
//
//  Created by Tyler Lawrence on 3/2/26.
//

import Foundation

struct Inventory {
    private(set) var items: [ItemStack] = []
    let maxWeight: Int = 50
    var totalWeight: Int {
        items.reduce(0, { $0 + $1.totalWeight })
    }

    mutating func add(_ itemType: ItemType, quantity: Int = 1) {
        if itemType.isStackable {
            addItemToStack(itemType: itemType, quantity: quantity)
        } else {
            items.append(ItemStack(itemType: itemType, quantity: 1))
        }
    }

    mutating func addItemToStack(itemType: ItemType, quantity: Int) {
        if let stackIndex = items.indexFor(itemType) {
            self.items[stackIndex].addItem()
        } else {
            items.append(ItemStack(itemType: itemType, quantity: quantity))
        }
    }

    private func indexForItemStack(_ itemStack: ItemStack) -> Int? {
        items.firstIndex(where: { $0.itemType == itemStack.itemType } )
    }
}
