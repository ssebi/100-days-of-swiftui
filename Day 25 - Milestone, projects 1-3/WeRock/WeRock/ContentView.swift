//
//  ContentView.swift
//  WeRock
//
//  Created by Sebastian Vidrea on 21/10/2019.
//  Copyright © 2019 ApCompany. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let options = ["✊", "🖐", "✌️"]
    let maxRounds = 10
    @State var shouldWin = Bool.random()
    @State var currentRound = 0
    @State var score = 0
    @State var appsChoice = Int.random(in: 0 ..< 3)
    @State var showScore = false

    var body: some View {
        NavigationView {
            VStack(spacing: 100) {
                Spacer()
                Text("I pick \(options[appsChoice])")
                    .font(.largeTitle)
                VStack(spacing: 20) {
                    Text("What's your pick to \(shouldWin ? "win" : "loose")?")
                        .font(.title)
                    HStack(spacing: 50) {
                        ForEach(options, id: \.self) { text in
                            Button(action: {
                                let position = self.options.firstIndex(of: text) ?? 0
                                guard self.currentRound < self.maxRounds else { return }
                                guard position != self.appsChoice else { return }

                                switch self.shouldWin {
                                    case true:
                                        if (3 + position - self.appsChoice) % 3 == 1 {
                                            self.score += 1
                                        } else {
                                            if self.score > 0 {
                                                self.score -= 1
                                            }
                                        }
                                    case false:
                                        if (3 + position - self.appsChoice) % 3 != 1 {
                                            self.score += 1
                                        } else {
                                            if self.score > 0 {
                                                self.score -= 1
                                            }
                                        }
                                }

                                self.appsChoice = Int.random(in: 0 ..< self.options.count)
                                self.shouldWin = Bool.random()
                                self.currentRound += 1
                                if self.currentRound == self.maxRounds {
                                    self.showScore = true
                                }
                            }) {
                                Text(text)
                                    .font(.largeTitle)
                            }
                        }
                    }
                }
                Spacer()
                HStack {
                    Rectangle()
                        .frame(width: 20, height: 50)
                        .foregroundColor(.clear)
                    Text("\(currentRound)/\(maxRounds)")
                    Spacer()
                    Text("Score \(score)")
                    Rectangle()
                        .frame(width: 20, height: 50)
                        .foregroundColor(.clear)
                }
            }
            .alert(isPresented: $showScore) {
                Alert(title: Text("Your score was \(self.score)"), message: nil, dismissButton: .default(Text("OK"), action: {
                    self.resetGame()
                }))
            }
            .navigationBarTitle("We Rock")
        }
    }

    private func resetGame() {
        currentRound = 0
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
