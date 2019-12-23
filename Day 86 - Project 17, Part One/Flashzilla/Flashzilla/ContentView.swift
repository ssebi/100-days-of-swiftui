//
//  ContentView.swift
//  Flashzilla
//
//  Created by Sebastian Vidrea on 22/12/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAmount: CGFloat = 0
    @State private var finalAmount: CGFloat = 1

    @State private var currentAmountDegrees: Angle = .degrees(0)
    @State private var finalAmountDegrees: Angle = .degrees(0)

    var body: some View {
        TabView {
            SimpleGestures()
                .tabItem {
                    Image(systemName: "s.square.fill")
                    Text("Simple")
                }
            ScaledExample()
                .tabItem {
                    Image(systemName: "s.square.fill")
                    Text("Scaled")
                }
            RotationExample()
                .tabItem {
                    Image(systemName: "r.square.fill")
                    Text("Rotation")
                }
            MoreGestures()
                .tabItem {
                    Image(systemName: "m.square.fill")
                    Text("Multiple")
                }
            ComplexExample()
                .tabItem {
                    Image(systemName: "c.square.fill")
                    Text("Complex Gestures")
                }
            HapticsView()
                .tabItem {
                    Image(systemName: "o.square.fill")
                    Text("Haptics")
                }
            HitTestExample()
                .tabItem {
                    Image(systemName: "h.square.fill")
                    Text("HitTest")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
