//
//  ContentView.swift
//  Animations
//
//  Created by Sebastian Vidrea on 26/10/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    @State private var animationAmount2: CGFloat = 1

    var body: some View {
        VStack {
            Spacer()

            Button("Tap Me") { }
                .padding(50)
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.red)
                        .scaleEffect(animationAmount)
                        .opacity(Double(2 - animationAmount))
                        .animation(
                            Animation.easeInOut(duration: 1)
                                .repeatForever(autoreverses: false)
                    )
            )
                .onAppear {
                    self.animationAmount = 2
            }

            Stepper("Scale amount", value:
                $animationAmount2.animation(), in: 1...3)

            Spacer()

            Button("Tap Me") {
                self.animationAmount2 += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount2)

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
