//
//  AddView.swift
//  iExpense
//
//  Created by Sebastian Vidrea on 03/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""

    @ObservedObject var expenses: Expenses

    @Environment(\.presentationMode) var presentationMode

    static let types = ["Business", "Personal"]

    @State private var isShowingAlert = false
    @State private var alertMessage = Text("That's not a valid number")

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount), actualAmount > 0 {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.isShowingAlert.toggle()
                }
            })
                .alert(isPresented: $isShowingAlert) {
                    Alert(title: Text("Error"), message: alertMessage, dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
