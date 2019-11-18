//
//  Order.swift
//  CupcakeCorner
//
//  Created by Sebastian Vidrea on 18/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import Foundation

class OrderWrapper: ObservableObject {
    @Published var order = Order()

    var hasValidAddress: Bool {
        if order.name.trimmingCharacters(in: .whitespaces).isEmpty ||
            order.streetAddress.trimmingCharacters(in: .whitespaces).isEmpty ||
            order.city.trimmingCharacters(in: .whitespaces).isEmpty ||
            order.zip.trimmingCharacters(in: .whitespaces).isEmpty {
            return false
        }

        return true
    }

    var cost: Double {
        // $2 per cake
        var cost = Double(order.quantity) * 2

        // complicated cakes cost more
        cost += (Double(order.type) / 2)

        // $1/cake for extra frosting
        if order.extraFrosting {
            cost += Double(order.quantity)
        }

        // $0.50/cake for sprinkles
        if order.addSprinkles {
            cost += Double(order.quantity) / 2
        }

        return cost
    }
}

struct Order: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 3

    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false

    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
}
