//
//  DifferentBlendModes.swift
//  Animations
//
//  Created by Sebastian Vidrea on 08/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct DifferentBlendModes: View {
    @State private var amount: CGFloat = 0.0

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)

                Circle()
                    .fill(Color(red: 0, green: 1, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)

                Circle()
                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)

            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct DifferentBlendModes_Previews: PreviewProvider {
    static var previews: some View {
        DifferentBlendModes()
    }
}
