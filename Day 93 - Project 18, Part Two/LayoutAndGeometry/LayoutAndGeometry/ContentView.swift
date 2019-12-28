//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Sebastian Vidrea on 28/12/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            VStack {
                Text("Hello, World!")
                    .background(Color.red)
                    .position(x: 100, y: 100)

                Text("Hello, World!")
                    .background(Color.red)
                    .position(x: 100, y: 100)
            }
            .offset(x: 10, y: 10)
            .tabItem {
                Image(systemName: "p.square.fill")
                Text("Positioning")
            }

            GeometryReaderExplained()
                .tabItem {
                    Image(systemName: "g.square.fill")
                    Text("Geometry Reader")
                }

            ScrollViewEffects()
                .tabItem {
                    Image(systemName: "s.square.fill")
                    Text("Scroll Effect")
                }

            CoverFlow()
                .tabItem {
                    Image(systemName: "c.square.fill")
                    Text("Cover Flow")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
