//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Sebastian Vidrea on 03/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import Foundation
import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int

    var foregroundColor: Color {
        if amount < 10 {
            return .green
        } else if amount > 100 {
            return .orange
        } else {
            return .yellow
        }
    }
}
