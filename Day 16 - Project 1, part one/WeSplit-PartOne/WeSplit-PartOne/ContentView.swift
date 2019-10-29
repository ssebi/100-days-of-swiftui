//
//  ContentView.swift
//  WeSplit-PartOne
//
//  Created by Sebastian Vidrea on 29/10/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    @State private var selectedStudent = "Harry"

    private let students = ["Harry", "Hermione", "Ron"]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Button("Tap Count: \(tapCount)") {
                        self.tapCount += 1
                    }
                    TextField("Enter your name", text: $name)
                    Text("Your name is: \(name)")
                }
                Section {
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(0 ..< students.count) {
                            Text(self.students[$0])
                        }
                    }
                }
            }
            .navigationBarTitle(Text("SwiftUI"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
