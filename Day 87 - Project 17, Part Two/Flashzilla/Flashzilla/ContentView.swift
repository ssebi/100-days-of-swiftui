//
//  ContentView.swift
//  Flashzilla
//
//  Created by Sebastian Vidrea on 23/12/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SystemNotifications()
                .tabItem {
                    Image(systemName: "s.square.fill")
                    Text("System Notifications")
                }

            DifferentiateWithoutColorExample()
                .tabItem {
                    Image(systemName: "d.square.fill")
                    Text("Differentiate Color")
                }

            ReduceMotionExample()
                .tabItem {
                    Image(systemName: "r.square.fill")
                    Text("Reduce Motion")
                }

            ReduceTransparencyExample()
                .tabItem {
                    Image(systemName: "r.square.fill")
                    Text("Reduce Transparency")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
