//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Sebastian Vidrea on 03/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
