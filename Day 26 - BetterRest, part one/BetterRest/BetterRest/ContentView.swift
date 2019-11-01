//
//  ContentView.swift
//  BetterRest
//
//  Created by Sebastian Vidrea on 22/10/2019.
//  Copyright © 2019 ApCompany. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()

    var body: some View {
        VStack {
            Stepper(value: $sleepAmount, in: 4 ... 12, step: 0.25) {
                Text("\(sleepAmount, specifier: "%.2f") hours")
            }
            DatePicker("Please enter a date", selection: $wakeUp, in: Date()..., displayedComponents: .date)
                .labelsHidden()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
