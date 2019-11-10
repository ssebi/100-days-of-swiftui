//
//  CircleStroke.swift
//  Drawing
//
//  Created by Sebastian Vidrea on 05/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct CircleStroke: View {
    var body: some View {
        Circle()
            .strokeBorder(Color.blue, lineWidth: 40)
    }
}

struct CircleStroke_Previews: PreviewProvider {
    static var previews: some View {
        CircleStroke()
    }
}
