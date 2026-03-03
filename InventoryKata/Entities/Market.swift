//
//  Shop.swift
//  InventoryKata
//
//  Created by Tyler Lawrence on 3/3/26.
//

import Foundation

struct Market {
    var merchant: Merchant
    var player: Player
    var selectedItemStack: ItemStack?

    init(merchant: inout Merchant, player: inout Player, selectedItemStack: ItemStack? = nil) {
        self.merchant = merchant
        self.player = player
        self.selectedItemStack = selectedItemStack
    }

    mutating func selectItem(_ itemType: ItemType, from merchant: Merchant) {
        if itemType.isStackable {
             requestQuantity()
        } else {
             confirmPurchase(quantity: 1)
        }
    }

    mutating func requestQuantity() -> () {
        let quantity = UserRequest.requestInt(message: "Quantity: ")
        return confirmPurchase(quantity: quantity)
    }

    mutating func confirmPurchase(quantity: Int) {
        guard let selectedItemStack else { return }
        let totalPrice: Decimal = selectedItemStack.itemType.pricePerUnit * Decimal(quantity)
        let purchaseMessage = "Purchase \(selectedItemStack.quantity) \(selectedItemStack.itemType) for \(totalPrice) money"
        let orderConfirmed: Bool = UserRequest.requestBool(message: purchaseMessage)

        if orderConfirmed {
            processTransaction(quantity: quantity)
        } else {
            // clear cart?
        }
    }

    mutating func processTransaction(quantity: Int) {
        guard let selectedItemStack else { return }
        // remove item from merchant
        guard merchant.hasItem(selectedItemStack.itemType) else { return }
        guard let itemToSell = merchant.inventory.remove(
            selectedItemStack.itemType,
            quantity: quantity
        ) else { return }
        let totalPrice = selectedItemStack.itemType.pricePerUnit * Decimal(quantity)

        guard player.money >= totalPrice else { return }
        player.money -= totalPrice
        merchant.money += totalPrice

        player.inventory.add(itemToSell)
    }
}
