//
//  ReduceTransparencyExample.swift
//  Flashzilla
//
//  Created by Sebastian Vidrea on 24/12/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct ReduceTransparencyExample: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency

    var body: some View {
        Text("Hello, World!")
            .padding()
            .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
            .foregroundColor(Color.white)
            .clipShape(Capsule())
    }
}

struct ReduceTransparencyExample_Previews: PreviewProvider {
    static var previews: some View {
        ReduceTransparencyExample()
    }
}
