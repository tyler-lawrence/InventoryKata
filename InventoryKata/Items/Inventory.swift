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
        items.reduce(0) { $0 + $1.totalWeight }
    }

    mutating func add(_ itemType: ItemType, quantity: Int = 1) {
        if itemType.isStackable {
            addItemToStack(itemType: itemType, quantity: quantity)
        } else {
            items.append(ItemStack(itemType: itemType, quantity: quantity))
        }
    }

    mutating func add(_ itemStack: ItemStack) {
        if items.hasItemMatching(itemStack.itemType) {
            addItemToStack(itemType: itemStack.itemType, quantity: itemStack.quantity)
        } else {
            items.append(itemStack)
        }
    }

    private mutating func addItemToStack(itemType: ItemType, quantity: Int) {
        guard itemType.isStackable else { return }
        if let index = indexForItem(itemType) {
            items[index].addQuantity(quantity)
        }
    }

    mutating func remove(_ itemType: ItemType, quantity: Int) -> ItemStack? {
        if itemType.isStackable {
            if let removedStack = removeItemFromStack(itemType: itemType, quantity: quantity) {
                return removedStack
            } else {
                return nil
            }
        } else {
            if let index = indexForItem(itemType) {
               let removedStack = items.remove(at: index)
                return removedStack
            } else {
                return nil
            }
        }
    }

    mutating func removeItemFromStack(itemType: ItemType, quantity: Int) -> ItemStack? {
        guard itemType.isStackable else { return nil }
        if let index = indexForItem(itemType) {
            items[index].removeQuantity(quantity)
            if items[index].quantity == 0 {
                items.remove(at: index)
            }
            let stack = ItemStack(itemType: itemType, quantity: quantity)
            return stack
        } else {
            return nil
        }
    }

    func display() {
        print("Name | Weight | Qty | Value")
        for item in items {
            print("\(item.itemType) | \(item.totalWeight) | \(item.quantity) | \(item.totalValue)")
        }
    }

    //MARK: Helper
    private func indexForItem(_ itemType: ItemType) -> Int? {
        items.firstIndex(where: { $0.itemType == itemType } )
    }

    //MARK: Sample data
    static let sample = Inventory(items: [
        ItemStack(itemType: .sword, quantity: 1),
        ItemStack(itemType: .sword, quantity: 1)
    ])
}
