//
//  ExplicitAnimstion.swift
//  Animations
//
//  Created by Sebastian Vidrea on 26/10/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct ExplicitAnimation: View {
    @State private var animationAmount = 0.0

    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                self.animationAmount += 360
            }
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct ExplicitAnimstion_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimation()
    }
}
