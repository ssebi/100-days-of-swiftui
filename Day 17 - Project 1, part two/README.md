# Day 17: Project 1 - WeSplit, Part Two
🔗 [HWS Day 17](https://www.hackingwithswift.com/100/swiftui/17)
## 📝 Notes
Topics covered

- Reading text from the user with TextField
- Creating pickers in a form
- Adding a segmented control for tip percentages
- Calculating the total per person

# Reading text from the user with TextField
We've seen a similar code snippet in the previous day:

```swift
Form {
    Section {
        TextField("Amount", text: $checkAmount)
    }

    Section {
        Text("$\(checkAmount)")
    }
}
```

Now what happens here in more detail is, when a `@State` property changes the `body` property will be re-invoked which means the UI will reload. One thing we should take into consideration is that the `two-way binding on a TextField` only works with `String` properties. So `checkAmount` has to be of type `String`.

- Keyboard input type can be changes using the `.keyboardType()` modifier (eg. `.keyboardType(.decimalPad)`)

# Creating pickers in a form
What's interesting in SwiftUI is that if the `Picker` is wrapped inside a `Form` it behaves differently than if wrapped inside other container view. That simply exemplifies the power of declarative UI.

```swift
Picker("Number of people", selection: $numberOfPeople) {
    ForEach(2 ..< 100) {
        Text("\($0) people")
    }
}
```

# Adding a segmented control for tip percentages
This type of control is perfect for situations where you just want to display a small amount of options horizontally.
To do that, we have to add a modifier to the `Picker` called `pickerStyle` with the `SegmentedPickerStyle()` style:

```swift
Picker("Tip percentage", selection: $tipPercentage) {
    ForEach(0 ..< tipPercentages.count) {
        Text("\(self.tipPercentages[$0])%")
    }
}.pickerStyle(SegmentedPickerStyle())
``` 
# Calculating the total per person
- We can add some C-style *specifiers* to format strings using interpolation
```swift
Text("$\(totalPerPerson, specifier: "%.2f")")
```

`.2f` means floating-point numbers with two digits after the decimal point. `g` for example removes all insignificant trailing zeroes. More info here [https://en.wikipedia.org/wiki/Printf_format_string](https://en.wikipedia.org/wiki/Printf_format_string)