# Day 30 - Project 5: Word Scramble, Part Two
🔗 [HWS Day 30](https://www.hackingwithswift.com/100/swiftui/30)

# 📝 Notes
Covered topics:

- Adding to a list of words
- Running code when our app launches
- Validating words with UITextChecker

# Adding to a list of words

- You can add a rounded border around `TextFields` and some padding to make them stand out a little bit more like this:

```swift
.textFieldStyle(RoundedBorderTextFieldStyle())
.padding()
```

- You can call a function when the user taps the `Enter` button on the keyboard like so:

```swift
TextField("Enter your word", text: $newWord, onCommit: addNewWord)
```

where `addNewWord` is the function that we want to call.

> -  SF Symbols provides numbers in circles from 0 through 50, all named using the format “x.circle.fill” – so 1.circle.fill, 20.circle.fill.

- SwiftUI creates a horizontal stack automatically if we add more views in a `List`, so we don't have to do that manually.

# Running code when our app launches

When the app loads we need to:

> - Find start.txt in our bundle
- Load it into a string
- Split that string into array of strings, with each element being one word
- Pick one random word from there to be assigned to rootWord, or use a sensible default if the array is empty.

- The tricky part is that, if any of these tasks fail, there's no point in continuing to run the app because it will basically run in a broken state. So what we can do is use `fatalError()` to stop the app immediately.
- We can run code when a view appears by using `.onAppear(perform: startGame)`, where `startGame` is the name of our function.

# Validating words with UITextChecker

- Here we add validations to the words that users can enter and we show an alert in the case that something is wrong.