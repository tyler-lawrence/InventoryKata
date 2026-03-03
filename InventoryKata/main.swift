//
//  main.swift
//  InventoryKata
//
//  Created by Tyler Lawrence on 2/28/26.
//

import Foundation

var playerInventory = Inventory(items: [
    ItemType.sword.id: ItemStack(itemType: .sword, quantity: 1),
    ItemType.potion.id: ItemStack(itemType: .potion, quantity: 2),
])

var shop = Inventory(items: [
    ItemType.sword.id: ItemStack(itemType: .sword, quantity: 1),
    ItemType.potion.id: ItemStack(itemType: .potion, quantity: 2),
])
