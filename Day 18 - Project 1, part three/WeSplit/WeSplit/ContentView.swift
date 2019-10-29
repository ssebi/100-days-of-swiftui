//
//  ContentView.swift
//  WeSplit
//
//  Created by Sebastian Vidrea on 29/10/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2

    private let tipPercentages = [10, 15, 20, 25, 0]

    private var peopleCount: Double { return Double(numberOfPeople) ?? 0 }
    private var tipSelection: Double { return Double(tipPercentages[tipPercentage]) }
    private var orderAmount: Double { return Double(checkAmount) ?? 0 }
    private var tipValue: Double { return orderAmount / 100 * tipSelection }
    private var grandTotal: Double { return orderAmount + tipValue }
    private var totalPerPerson: Double { let amountPerPerson = grandTotal / peopleCount; return amountPerPerson }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson.isNaN || totalPerPerson.isInfinite ? 0 : totalPerPerson, specifier: "%.2f")")
                }

                Section(header: Text("Total amount for check")) {
                    Text("$\(grandTotal, specifier: "%.2f")")
                        .foregroundColor(tipPercentages[tipPercentage] == 0 ? .red : .black)
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
