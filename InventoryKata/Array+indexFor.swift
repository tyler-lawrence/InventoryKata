//
//  Array+indexFor.swift
//  InventoryKata
//
//  Created by Tyler Lawrence on 3/2/26.
//

import Foundation

extension Array where Element == ItemStack {
    func indexFor(_ itemType: ItemType) -> Int? {
        self.firstIndex(where: { $0.itemType == itemType })
    }
}
