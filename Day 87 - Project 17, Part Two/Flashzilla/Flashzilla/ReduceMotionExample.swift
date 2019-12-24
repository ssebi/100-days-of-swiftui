//
//  ReduceMotionExample.swift
//  Flashzilla
//
//  Created by Sebastian Vidrea on 24/12/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct ReduceMotionExample: View {
    @State private var scale: CGFloat = 1

    var body: some View {
        Text("Hello, World!")
            .scaleEffect(scale)
            .onTapGesture {
                withOptionalAnimation {
                    self.scale *= 1.5
                }
        }
    }
}

struct ReduceMotionExample_Previews: PreviewProvider {
    static var previews: some View {
        ReduceMotionExample()
    }
}
