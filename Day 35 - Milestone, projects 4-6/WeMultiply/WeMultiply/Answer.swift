//
//  Answer.swift
//  WeMultiply
//
//  Created by Sebastian Vidrea on 09/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

/// All the game logic resides in this class
/// I don't know if it's a good pattern or not but is sure is easy to do so
class Answer: ObservableObject {
    @Published var selectedMultiplicationTable = 0
    @Published var selectedNumberOfQuestions = 0
    @Published var questions = [Question]()
    @Published var currentQuestion = 0
    @Published private var correctAnswersCount = 0

    var question: Question {
        questions[currentQuestion]
    }

    var numberOfQuestions = [5, 10, 20, 100]
    private var possibleValues = [Int](1...12)
    private var randomFirstTableElement: Int {
        possibleValues.randomElement() ?? 1
    }
    private var randomSecondTableElement: Int {
        possibleValues.randomElement() ?? 1
    }

    @Published var isShowingAlert = false
    @Published var alertMessage = ""

    @Published var text = ""
    @Published var goTapped = false {
        didSet {
            checkAnswer()
        }
    }

    @Published var isShowing = true
    @Published var shouldStartGame = false {
        didSet {
            startGame()
        }
    }
    @Published var shouldResetGame = false {
        didSet {
            resetGame()
        }
    }

    private func startGame() {
        questions = generateQuestions()
        withAnimation {
            isShowing.toggle()
        }
    }

    private func generateQuestions() -> [Question] {
        var questions = [Question]()

        if selectedNumberOfQuestions == 100 {
            // That's the all case
            for firstNumber in possibleValues {
                for secondNumber in possibleValues {
                    questions.append(Question(firstNumber: firstNumber, secondNumber: secondNumber))
                }
            }
        } else {
            for _ in 0...numberOfQuestions.count {
                questions.append(Question(firstNumber: possibleValues[selectedMultiplicationTable],
                                          secondNumber: randomSecondTableElement))
            }
        }

        print("Generated questions")
        print(questions)

        return questions
    }

    private func checkAnswer() {
        guard goTapped == true else { return }
        if Int(text) == questions[currentQuestion].firstNumber * questions[currentQuestion].secondNumber {
            correctAnswersCount += 1
        }

        nextQuestion()
        text = ""
        goTapped = false
    }

    private func nextQuestion() {
        if currentQuestion == selectedNumberOfQuestions - 1 {
            alertMessage = "You got \(correctAnswersCount) out of \(selectedNumberOfQuestions)"
            isShowingAlert.toggle()
        } else {
            currentQuestion += 1
            print(currentQuestion)
        }
    }

    private func resetGame() {
        correctAnswersCount = 0
        currentQuestion = 0
        questions = generateQuestions()
        isShowing.toggle()
    }
}
