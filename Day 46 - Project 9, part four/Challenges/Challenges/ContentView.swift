//
//  ContentView.swift
//  Challenges
//
//  Created by Sebastian Vidrea on 10/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct Triangle: Shape {
    var arrowWidth: CGFloat
    var animatableData: CGFloat {
        get { arrowWidth }
        set { self.arrowWidth = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: rect.maxX / 2 - arrowWidth, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: rect.maxX / 2 - arrowWidth, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX / 2 + arrowWidth, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX / 2 + arrowWidth, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: rect.maxX , y: rect.maxY / 2))
        path.closeSubpath()

        return path
    }
}

struct ContentView: View {
    @State var lineWidth: CGFloat = 1
    let minValue: CGFloat = 0
    let maxValue: CGFloat = 20

    @State var arrowWidth: CGFloat = 10

    var body: some View {
        VStack {
            Triangle(arrowWidth: arrowWidth)
                .stroke(Color.red, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .frame(width: 300, height: 400)
                .animation(.default)

            Spacer()
                .frame(height: 50)

            VStack {
                Text("Line Width")
                Slider(value: $lineWidth, in: minValue...maxValue)
                .padding()
            }

            VStack {
                Text("Arrow Width")
                Stepper("Arrow Width", value: $arrowWidth, in: 20...100, step: 30)
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
