//
//  ItemType.swift
//  InventoryKata
//
//  Created by Tyler Lawrence on 3/2/26.
//

import Foundation

enum ItemType: Hashable {
    case sword
    case potion
    case arrow
    case armor

    var id: String {
        switch self {
        case .sword: "sword"
        case .potion: "potion"
        case .arrow: "arrow"
        case .armor: "armor"
        }
    }

    var isStackable: Bool {
        switch self {
        case .sword, .armor: return false
        case .potion, .arrow: return true
        }
    }

    var isConsumable: Bool {
        switch self {
        case .sword, .arrow, .armor: return false
        case .potion: return true
        }
    }

    var weight: Int {
        switch self {
        case .sword: 10
        case .potion: 1
        case .arrow: 1
        case .armor: 20
        }
    }
}
