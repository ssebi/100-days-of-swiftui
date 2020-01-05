//
//  SettingsView.swift
//  Flashzilla
//
//  Created by Sebastian Vidrea on 05/01/2020.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode

    @Binding var canPutCardsBack: Bool

    var body: some View {
        NavigationView {
            Form {
                Section(footer: Text("Toggling this on will cause the cards where you gave wrong answers to go back into the deck so you can answer them again")) {
                    Toggle(isOn: $canPutCardsBack) {
                        Text("Put cards back in the deck?")
                    }
                }
            }
            .navigationBarTitle("Settings")
            .navigationBarItems(trailing: Button("Done", action: dismiss))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(canPutCardsBack: .constant(true))
    }
}
