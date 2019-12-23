//
//  HitTestExample.swift
//  Flashzilla
//
//  Created by Sebastian Vidrea on 23/12/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct HitTestExample: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        print("Rectangle tapped!")
                }

                Circle()
                    .fill(Color.red)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        print("Circle tapped!")
                }
            }

            VStack {
                Text("Hello")
                Spacer().frame(height: 100)
                Text("World")
            }
            .contentShape(Rectangle())
            .onTapGesture {
                print("VStack tapped!")
            }
        }
    }
}

struct HitTestExample_Previews: PreviewProvider {
    static var previews: some View {
        HitTestExample()
    }
}
