//
//  ArcDrawing.swift
//  Drawing
//
//  Created by Sebastian Vidrea on 05/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct Arc: Shape, InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool

    var insetAmount: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        /// this way the Arc is drawn in a non-natural way. ( which is SwiftUI's way )
//        var path = Path()
//        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)

        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

        return path
    }

    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct ArcDrawing: View {
    var body: some View {
        Arc(startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)
            .stroke(Color.blue, lineWidth: 10)
            .frame(width: 300, height: 300)
    }
}

struct ArcDrawing_Previews: PreviewProvider {
    static var previews: some View {
        ArcDrawing()
    }
}
