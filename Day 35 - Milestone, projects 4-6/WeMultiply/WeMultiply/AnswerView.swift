//
//  AnswerView.swift
//  WeMultiply
//
//  Created by Sebastian Vidrea on 08/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct AnswerView: View {
    @ObservedObject var answer: Answer

    init(answer: Answer) {
        self.answer = answer
    }

    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("How much is")
                Text("\(answer.question.firstNumber) X \(answer.question.secondNumber)")
                    .font(.largeTitle)
                    .fontWeight(.black)
            }

            Spacer()

            VStack(spacing: 40) {
                HStack {
                    Text("Answer:")
                    Spacer()
                    Text("\(answer.text) ")
                        .font(.largeTitle)
                        .lineLimit(1)
                    Button(action: {
                        self.deleteTapped()
                    }) {
                        Image(systemName: "delete.left")
                            .renderingMode(.original)
                    }
                    .padding()
                }
                .padding()

                VStack {
                    HStack {
                        ForEach(1 ..< 4) { number in
                            Button(action: {
                                self.buttonTaped(number)
                            }) {
                                Image(systemName: "\(number).circle")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }
                    HStack {
                        ForEach(4 ..< 7) { number in
                            Button(action: {
                                self.buttonTaped(number)
                            }) {
                                Image(systemName: "\(number).circle")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }
                    HStack {
                        ForEach(7 ..< 10) { number in
                            Button(action: {
                                self.buttonTaped(number)
                            }) {
                                Image(systemName: "\(number).circle")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }
                    HStack {
                        Button(action: {
                            self.buttonTaped(0)
                        }) {
                            Image(systemName: "\(0).circle")
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }

                Button("Go") {
                    self.goTapped()
                }
            }
        }
        .padding()
        .font(.largeTitle)
    }

    private func buttonTaped(_ number: Int) {
        guard answer.text.count < 3 else { return }
        answer.text += "\(number)"
    }

    private func deleteTapped() {
        guard answer.text.count > 0 else { return }
        answer.text.removeLast()
    }

    private func goTapped() {
        answer.goTapped = true
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(answer: Answer())
    }
}
