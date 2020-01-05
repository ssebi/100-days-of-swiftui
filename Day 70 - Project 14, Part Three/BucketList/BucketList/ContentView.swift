//
//  ContentView.swift
//  BucketList
//
//  Created by Sebastian Vidrea on 14/12/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI
import MapKit
import LocalAuthentication

struct ContentView: View {
    @State private var selectedPlace: MKPointAnnotation?
    @State private var locations = [CodableMKPointAnnotation]()
    @State private var showingPlaceDetails = false
    @State private var showingEditScreen = false
    @State private var isUnlocked = false

    var body: some View {
        ZStack {
            if isUnlocked {
                MainView(selectedPlace: $selectedPlace,
                         locations: $locations,
                         showingPlaceDetails: $showingPlaceDetails,
                         showingEditScreen: $showingEditScreen)
            } else {
                Button("Unlock Places") {
                    self.authenticate()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
        .alert(isPresented: $showingPlaceDetails) {
            Alert(title: Text(selectedPlace?.title ?? "Unknown"), message: Text(selectedPlace?.subtitle ?? "Missing place information"), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
                self.showingEditScreen = true
                }
            )
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: saveData) {
            if self.selectedPlace != nil {
                EditView(placemark: self.selectedPlace!)
            }
        }
        .onAppear(perform: loadData)
    }

    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    private func loadData() {
        let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")

        do {
            let data = try Data(contentsOf: filename)
            locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
        } catch {
            print("Unable to load saved data.")
        }
    }

    private func saveData() {
        do {
            let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
            let data = try JSONEncoder().encode(self.locations)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }

    private func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate yourself to unlock your places."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        // error
                    }
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
