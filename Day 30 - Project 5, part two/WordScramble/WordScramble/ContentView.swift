//
//  ContentView.swift
//  WordScramble
//
//  Created by Sebastian Vidrea on 25/10/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""

    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false

    @State private var score = 0
    @State private var extraPointsForUsedWordsCount = 0
    var usedWordsEnumerated: [(offset: Int, element: String)] {
        usedWords.enumerated().map { $0 }
    }
    var body: some View {
        NavigationView {
            GeometryReader { fullView in
                VStack {
                    TextField("Enter your word", text: self.$newWord, onCommit: self.addNewWord)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .autocapitalization(.none)

                    List(self.usedWordsEnumerated, id: \.element) { (index, word) in
                        GeometryReader { geo in
                            HStack {
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                            .alignmentGuide(.leading, computeValue: { _ in return 0 })
                            .accessibilityElement(children: .ignore)
                            .accessibility(label: Text("\(word), \(word.count) letters"))
                            .frame(width: fullView.size.width)
                            .transformEffect(geo.frame(in: .global).minY > fullView.size.height / 1.05 ? .init(translationX: geo.frame(in: .global).minY - fullView.size.width / 0.6, y: 0) : .init(translationX: 0, y: 0))
                        }
                    }

                    Text("Your score is \(self.score + self.extraPointsForUsedWordsCount)")
                }
                .navigationBarItems(leading: Button("Reset", action: self.startGame))
                .navigationBarTitle(self.rootWord)
            }
        }
        .onAppear(perform: startGame)
        .alert(isPresented: $showingError) {
            Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
    }

    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // exit if the remaining string is empty
        guard answer.count > 0 else {
            return
        }

        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }

        guard isNotTheSameWord(word: answer) else {
            wordError(title: "Word is the same", message: "You can't use the same word")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not possible", message: "That isn't a real word.")
            return
        }

        usedWords.insert(answer, at: 0)
        newWord = ""
        calculateScore(for: answer)
    }

    func calculateScore(for answer: String) {
        switch answer.count {
            case 3...5:
                score += 1
            case 6:
                score += 2
            case 6...:
                score += 3
            default: break
        }

        switch usedWords.count {
            case 1...3:
                extraPointsForUsedWordsCount = 2
            case 4...5:
                extraPointsForUsedWordsCount = 3
            case 6...:
                extraPointsForUsedWordsCount = 4
            default: break
        }
    }

    func startGame() {
        // 1. Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the string up into an array of strings, splitting on line breaks
                let allWords = startWords.components(separatedBy: "\n")

                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"

                // If we are here everything has worked, so we can exit
                return
            }
        }

        // If were are *here* then there was a problem – trigger a crash and report the error
        fatalError("Could not load start.txt from bundle.")
    }

    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }

    func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }

    func isNotTheSameWord(word: String) -> Bool {
        guard word != rootWord else { return false }
        return true
    }

    func isReal(word: String) -> Bool {
        guard word.count > 2 else { return false }
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }

    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
