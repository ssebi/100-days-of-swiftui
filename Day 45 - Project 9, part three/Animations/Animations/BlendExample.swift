//
//  BlendExample.swift
//  Animations
//
//  Created by Sebastian Vidrea on 08/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct BlendExample: View {
    var body: some View {
        Image("Image")
            .colorMultiply(.red)
    }
}

struct BlendExample_Previews: PreviewProvider {
    static var previews: some View {
        BlendExample()
    }
}
