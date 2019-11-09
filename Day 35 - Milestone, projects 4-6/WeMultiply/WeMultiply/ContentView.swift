//
//  ContentView.swift
//  WeMultiply
//
//  Created by Sebastian Vidrea on 04/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct Question {
    var firstNumber: Int
    var secondNumber: Int
}

struct ContentView: View {
    @State private var alertTitle = "Finished"

    @ObservedObject var answer = Answer()

    var body: some View {
        NavigationView {
            VStack {
                if answer.isShowing {
                    GameSettingsView(answer: answer)
                } else {
                    AnswerView(answer: answer)
                }

                Spacer()
            }
            .navigationBarTitle("WeMultiply")
            .navigationBarItems(trailing: answer.questions.isEmpty ? Text("") : Text("\(answer.currentQuestion) / \(answer.questions.count)"))
        }
        .alert(isPresented: $answer.isShowingAlert) {
            Alert(title: Text("\(self.alertTitle)"), message: Text("\(self.answer.alertMessage)"), dismissButton: .default(Text("OK")) { self.answer.shouldResetGame = true })
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
