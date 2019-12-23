//
//  ScaledExample.swift
//  Flashzilla
//
//  Created by Sebastian Vidrea on 22/12/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct ScaledExample: View {
    @State private var currentAmount: CGFloat = 0
    @State private var finalAmount: CGFloat = 1

    var body: some View {
        Text("Hello, World!")
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { amount in
                        self.currentAmount = amount - 1
                }
                .onEnded { amount in
                    self.finalAmount += self.currentAmount
                    self.currentAmount = 0
                }
        )
    }
}

struct ScaledExample_Previews: PreviewProvider {
    static var previews: some View {
        ScaledExample()
    }
}
