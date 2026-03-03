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

    var totalValue: Decimal {
        itemType.pricePerUnit * Decimal(quantity)
    }

    init(itemType: ItemType, quantity: Int) {
        if itemType.isStackable {
            self.itemType = itemType
            self.quantity = quantity
        } else {
            print("this item doesn't stack; set the quantity to 1")
            self.itemType = itemType
            self.quantity = 1
        }
    }

    mutating func addQuantity(_ amount: Int = 1) {
        guard itemType.isStackable else {
            return
        }
        quantity += amount
    }

    mutating func removeQuantity(_ amount: Int = 1) {
        guard itemType.isStackable, amount <= quantity else {
            return
        }
        quantity -= amount
    }
}

extension Array where Element == ItemStack {
    func hasItemMatching(_ itemType: ItemType) -> Bool {
        self
            .map{ $0.itemType }
            .contains(where: { $0 == itemType } )
    }
}
