//
//  SimpleGestures.swift
//  Flashzilla
//
//  Created by Sebastian Vidrea on 22/12/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct SimpleGestures: View {
    var body: some View {
        Text("Hello, World!")
            .onTapGesture(count: 2) {
                print("Double tapped!")
            }
            .onLongPressGesture(minimumDuration: 2) {
                print("Long pressed!")
            }
            .onLongPressGesture(minimumDuration: 1, pressing: { inProgress in
                print("In progress: \(inProgress)!")
            }) {
                print("Long pressed!")
            }
    }
}

struct SimpleGestures_Previews: PreviewProvider {
    static var previews: some View {
        SimpleGestures()
    }
}
