//
//  ContentView.swift
//  HotProspects
//
//  Created by Sebastian Vidrea on 22/12/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    self.selectedTab = 1
                }
                .tabItem {
                    Image(systemName: "star")
                    Text("One")
                }
                .tag(0)

            Text("Tab 2")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Two")
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
