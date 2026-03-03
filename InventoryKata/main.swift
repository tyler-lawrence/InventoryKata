//
//  main.swift
//  InventoryKata
//
//  Created by Tyler Lawrence on 2/28/26.
//

import Foundation

var player = Player(name: "Adventurer")
var merchant = Merchant(
    inventory: Inventory(items: [
        ItemStack(itemType: .armor, quantity: 1),
        ItemStack(itemType: .sword, quantity: 1),
        ItemStack(itemType: .potion, quantity: 10)
    ]),
    money: 100
)

let market = Market(merchant: &merchant, player: &player)

merchant.inventory.display()

//UserRequest.request<Int>(ofType: Int.self, message:"enter a number")

//UserRequest.requestInt(message: "enter a number")
//UserRequest.requestBool(message: "proceed?")


//var shop1 = Shop(inventory: Inventory.sample, money: 100)
//var shop2 = Shop(inventory: Inventory.sample, money: 100)
//
//
