//
//  ContentView.swift
//  BetterRest
//
//  Created by Sebastian Vidrea on 22/10/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var store = SelectionStore()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text(store.desiredSleepTime)
                        .font(.title)
                }

                VStack(alignment: .leading, spacing: 0) {
                    DatePicker("Please enter a time", selection: $store.wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }

                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Stepper(value: $store.sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(store.sleepAmount, specifier: "%g") hours")
                    }
                }

                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily coffee intake")
                        .font(.headline)
                    Stepper(value: $store.coffeeAmount, in: 0.0 ... 20.0) {
                        if self.store.coffeeAmount == 1 {
                            Text("1 cup")
                        } else {
                            Text("\(self.store.coffeeAmount, specifier: "%g") cups")
                        }
                    }
                }
            }
            .navigationBarTitle("BetterRest")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
