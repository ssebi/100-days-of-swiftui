//
//  BluerExample.swift
//  Animations
//
//  Created by Sebastian Vidrea on 08/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct BluerExample: View {
    @State private var amount: CGFloat = 0.0
    
    var body: some View {
        VStack {
            Image("Image")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(Double(amount))
                .blur(radius: (1 - amount) * 20)

            Slider(value: $amount)
                .padding()
        }
    }
}

struct BluerExample_Previews: PreviewProvider {
    static var previews: some View {
        BluerExample()
    }
}
