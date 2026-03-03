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
        case .sword, .armor: false
        case .potion, .arrow: true
        }
    }

    var isConsumable: Bool {
        switch self {
        case .sword, .arrow, .armor: false
        case .potion: true
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

    var pricePerUnit: Decimal {
        switch self {
        case .armor: 10
        case .arrow: 1
        case .potion: 1
        case .sword: 15
        }
    }
}
