//
//  ContentView.swift
//  Challenges
//
//  Created by Sebastian Vidrea on 10/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let offset: CGFloat = rect.width / 6
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: rect.maxX / 2 - offset, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: rect.maxX / 2 - offset, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX / 2 + offset, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX / 2 + offset, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: rect.maxX , y: rect.maxY / 2))
        path.closeSubpath()

        return path
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Triangle()
                .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 300, height: 400)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
