//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sebastian Vidrea on 13/10/2019.
//  Copyright © 2019 App Company. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0

    @State private var animationAmount = 0.0
    @State private var animationOpacity = 1.0
    @State private var wrongAttempts: CGFloat = 1.0
    private let animationDuration = 1.0

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)

                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }

                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        FlagImage(imageName: self.countries[number])
                    }
                    .rotation3DEffect(.degrees(self.isCorrect(number) ? self.animationAmount : 0.0), axis: (x: 0, y: 1, z: 0))
                    .opacity(self.isCorrect(number) ? 1.0 : self.animationOpacity)
                    .modifier(Shake(animatableData: self.isCorrect(number) ? CGFloat() : self.wrongAttempts))
                }

                VStack {
                    Text("Your Score")
                    Text("\(score)")
                }
                .font(.headline)
                .foregroundColor(.white)

                Spacer()
            }
        }
    }

    private func isCorrect(_ number: Int) -> Bool {
        return number == self.correctAnswer
    }

    private func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 1

            withAnimation(.easeOut(duration: animationDuration)) {
                self.animationAmount += 360
                self.animationOpacity = 0.25
            }

            /// Would be nice to get rid of this
            DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                self.askQuestion()
                self.animationOpacity = 1.0
            }
        } else {
            if score >= 1 {
                score -= 1
            }
            withAnimation {
                self.wrongAttempts += 1
            }
        }
    }

    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

}

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)), y: 0))
    }
}

struct FlagImage: View {
    var imageName: String

    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
