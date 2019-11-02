# Day 29 - Project 5: Word Scramble, Part One
🔗 [HWS Day 29](https://www.hackingwithswift.com/100/swiftui/29)

# 📝 Notes
Covered topics:

- Word Scramble: Introduction
- Introducing List, your best friend
- Loading resources from your app bundle
- Working with strings

# Word Scramble: Introduction

>  The game will show players a random eight-letter word, and ask them to make words out of it. For example, if the starter word is “alarming” they might spell “alarm”, “ring”, “main”, and so on.

We'll learn about `List`, `onAppear()`, `Bundle`, `fatalError()` and more.

# Introducing List, your best friend

- `List` is the equivalent of `UITableView` meaning that we'll use  it a lot in our apps. It's much like a `Form`, in a sense that it it provides data that can be scrolled, but it is used for presenting data, rather than asking user input.
- Lists can have both static and dynamic data.
- The easies way to create a `List` with dynamic content only is this:

```swift
List(0..<5) {
    Text("Dynamic row \($0)")
}
```

- By using `id: \.self` we can let Swift uniquely identify all array members, so if one of them changes, only that one will get updated and redrawn in the UI.

```swift
struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]

    var body: some View {
        List(people, id: \.self) {
            Text($0)
        }
    }
}
```

# Loading resources from your app bundle

- a `Bundle` is created when Xcode builds the app. That's the place where all your code and additional assets are placed.
- That's the place to look for when we want to load a *.txt* file for example, and we do that like this:

```swift
if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
    // we found the file in our bundle!
}

if let fileContents = try? String(contentsOf: fileURL) {
    // we loaded the file into a string!
}
```

# Working with strings

- For this project, we're going to load over 10.000 eight-letter words and we're going to save them in an array by calling the `.components(separatedBy: "\n")` method.
- To check misspelled words, we're going to use the `UITextChecker` class, which is written in Objective-C.
- Although Swift uses a very advanced way of dealing with strings, Objective-C doesn't. That means we have to transform the string in something that Objective-C can work with. We can do that so:
```swift
let range = NSRange(location: 0, length: word.utf16.count)
```

where word is our Swift string.