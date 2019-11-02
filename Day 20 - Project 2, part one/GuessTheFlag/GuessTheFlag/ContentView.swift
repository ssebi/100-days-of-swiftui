//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sebastian Vidrea on 13/10/2019.
//  Copyright © 2019 App Company. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false

    var body: some View {
        ZStack {

            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Text("Hello World!")
                    .colorInvert()

                Button("Tap me") {
                    print("Button was tapped")
                }

                Button(action: {
                    print("Second buttons was tapped")
                }) {
                    HStack(spacing: 10) {
                        Image(systemName: "pencil")
                            .renderingMode(.original)
                            .colorInvert()
                        Text("Tap me too")
                    }
                }

                Button("Show alert") {
                    self.showAlert = true
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Hello"), message: Text("Just showing some alert"), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
