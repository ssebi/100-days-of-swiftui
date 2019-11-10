//
//  ContentView.swift
//  Animations
//
//  Created by Sebastian Vidrea on 08/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("Image")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)

            Rectangle()
                .fill(Color.red)
                .blendMode(.multiply)
        }
        .frame(maxWidth: .infinity, maxHeight: 276)
        .clipped()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
