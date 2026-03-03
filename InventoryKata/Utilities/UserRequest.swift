//
//  UserInteraction.swift
//  InventoryKata
//
//  Created by Tyler Lawrence on 3/3/26.
//

import Foundation

enum UserRequest {

    enum BoolRequest: String {
        case yes = "y"
        case no = "n"

        var asBool: Bool {
            switch self {
            case .yes: true
            case .no: false
            }
        }

        static func requestLabel() {
            print("[y]es")
            print("[n]o")
        }

        static func requestInputAgain() {
            print("press y for yes or n for no")
        }
    }

    static func requestInt(message: String) -> Int {
        print(message)
        let input = readLine()!
        if let number = Int(input) {
            return number
        } else {
            print("please enter a number 0-9")
            return requestInt(message: message)
        }
    }

    static func requestBool(message: String) -> Bool {
        print(message)
        UserRequest.BoolRequest.requestLabel()
        let input = readLine()!
        if let response = BoolRequest(rawValue: input) {
            return response.asBool
        } else {
            BoolRequest.requestInputAgain()
            return requestBool(message: message)
        }
    }

//    static func request<T: CanInitFromString>(ofType type: T, message: String) -> T {
//        print(message)
//        let input = readLine()!
//
//        return type.initialize(from: input) as! T
//    }
}

//protocol CanInitFromString {
//    associatedtype T
//    func initialize(from s: String) -> T?
//}
//
//extension Int: CanInitFromString {
//    func initialize(from s: String) -> Int? {
//        Int(s)
//    }
//}
//extension Bool: CanInitFromString {
//    func initialize(from s: String) -> Bool? {
//        s == "y" ? true : false
//    }
//}
