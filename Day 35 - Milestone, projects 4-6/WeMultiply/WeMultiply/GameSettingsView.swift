//
//  GameSettingsView.swift
//  WeMultiply
//
//  Created by Sebastian Vidrea on 09/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct GameSettingsView: View {
    @ObservedObject var answer: Answer

    init(answer: Answer) {
        self.answer = answer
    }

    var body: some View {
        Form {
            Section(header: Text("Select Multiplication Table")) {
                Picker("multiplication table", selection: $answer.selectedMultiplicationTable) {
                    ForEach(1..<13) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .labelsHidden()
            }

            Section(header: Text("Number of questions")) {
                Picker("nummber of question", selection: $answer.selectedNumberOfQuestions) {
                    ForEach(answer.numberOfQuestions, id: \.self) {
                        Text("\($0 > 20 ? "All" : "\($0)")")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .labelsHidden()
            }

            Button("Start") {
                self.answer.shouldStartGame = true
            }
            .frame(maxWidth: .infinity)
        }
        .transition(.slide)
        .animation(.default)
    }
}

struct GameSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GameSettingsView(answer: Answer())
    }
}
