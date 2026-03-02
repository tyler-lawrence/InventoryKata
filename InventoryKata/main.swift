//
//  main.swift
//  InventoryKata
//
//  Created by Tyler Lawrence on 2/28/26.
//

import Foundation

enum ItemType {
    case sword
    case potion
    case arrow

    var isStackable: Bool {
        switch self {
        case .sword: return false
        case .potion, .arrow: return true
        }
    }

    var isConsumable: Bool {
        switch self {
        case .sword, .arrow: return false
        case .potion: return true
        }
    }
}

struct ItemStack {
    private(set) var itemType: ItemType
    private(set) var quantity: Int

    mutating func addItem(amount: Int = 1) {
        guard itemType.isStackable else {
            return
        }
        quantity += amount
    }
}

extension Array where Element == ItemStack {
    func indexFor(_ itemType: ItemType) -> Int? {
        self.firstIndex(where: { $0.itemType == itemType })
    }
}

struct Inventory {
    private(set) var items: [ItemStack] = []

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

struct Player {
    let name: String
    var inventory: Inventory = Inventory()

    mutating func pickUpItem(_ itemType: ItemType) {
        inventory.add(itemType)
    }
}

