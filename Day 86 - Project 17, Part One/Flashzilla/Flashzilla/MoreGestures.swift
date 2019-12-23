//
//  MoreGestures.swift
//  Flashzilla
//
//  Created by Sebastian Vidrea on 22/12/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct MoreGestures: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .onTapGesture {
                    print("Text tapped")
            }
        }
        .simultaneousGesture(
            TapGesture()
                .onEnded { _ in
                    print("VStack tapped")
            }
        )
    }
}

struct MoreGestures_Previews: PreviewProvider {
    static var previews: some View {
        MoreGestures()
    }
}
