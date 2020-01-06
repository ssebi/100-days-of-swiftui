//
//  CardView.swift
//  Flashzilla
//
//  Created by Sebastian Vidrea on 27/12/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityEnabled) var accessibilityEnabled

    @State private var isShowingAnswer = false
    @State private var offsetWidth: CGFloat = 0
    @State private var feedback = UINotificationFeedbackGenerator()

    let card: Card

    private var color: Color {
        if offsetWidth > 0 {
            return Color.green
        } else if offsetWidth == 0 {
            return Color.white
        } else {
            return Color.red
        }
    }

    var removal: ((Bool) -> Void)? = nil

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    differentiateWithoutColor
                        ? Color.white
                        : Color.white
                            .opacity(1 - Double(abs(offsetWidth / 50)))

                )
                .background(
                    differentiateWithoutColor
                        ? nil
                        : RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(color)
                )
                .shadow(radius: 10)

            VStack {
                if accessibilityEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)

                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offsetWidth / 5)))
        .offset(x: offsetWidth * 5, y: 0)
        .opacity(2 - Double(abs(offsetWidth / 50)))
        .accessibility(addTraits: .isButton)
        .onTapGesture {
            self.isShowingAnswer.toggle()
        }
        .animation(.spring())
        .gesture(
            DragGesture()
                .onChanged { offset in
                    self.offsetWidth = offset.translation.width
                    self.feedback.prepare()
            }

            .onEnded { _ in
                if abs(self.offsetWidth) > 100 {
                    if self.offsetWidth > 0 {
                        self.feedback.notificationOccurred(.success)
                        self.removal?(true)
                    } else {
                        self.feedback.notificationOccurred(.error)
                        self.removal?(false)
                    }
                } else {
                    self.offsetWidth = .zero
                }
            }
        )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
