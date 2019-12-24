//
//  DifferentiateWithoutColorExample.swift
//  Flashzilla
//
//  Created by Sebastian Vidrea on 24/12/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct DifferentiateWithoutColorExample: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    var body: some View {
        HStack {
            if differentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }

            Text("Success")
        }
        .padding()
        .background(differentiateWithoutColor ? Color.black : Color.green)
        .foregroundColor(Color.white)
        .clipShape(Capsule())
    }
}

struct AccessibilityExample_Previews: PreviewProvider {
    static var previews: some View {
        DifferentiateWithoutColorExample()
    }
}
