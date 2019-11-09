//
//  ContentView.swift
//  iExpense
//
//  Created by Sebastian Vidrea on 03/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    var name: String

    var body: some View {
        VStack {
            Text("Hello, \(name)")
            Button("Dismiss") {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject private var user = User()
    @State private var showSheet = false

    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)

            Button("Show Sheet") {
                self.showSheet = true
            }
            .sheet(isPresented: $showSheet) {
                SecondView(name: "@twostraws")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
