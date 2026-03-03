//
//  MarketPlayer.swift
//  InventoryKata
//
//  Created by Tyler Lawrence on 3/3/26.
//

import Foundation

protocol MarketPlayer {
    var inventory: Inventory { get set }
    var money: Decimal { get set }

    func hasItem(_ itemType: ItemType) -> Bool
}

extension MarketPlayer {
    func hasItem(_ itemType: ItemType) -> Bool {
        inventory.items.hasItemMatching(itemType)
    }
}
