# Day 27 – Project 4: BetterRest, Part Two
🔗 [HWS Day 27](https://www.hackingwithswift.com/100/swiftui/27)

# 📝 Notes
Covered topics:

- Building a basic layout
- Connecting SwiftUI to Core ML
- Cleaning up the user interface

# Building a basic layout

- If we have a function `func calculateBedtime() { }` and we want to call it on the tap of a button, we can simply write this:

```swift
Button(action: calculateBedtime) {
    Text("Calculate")
}
```

- or add it as a navigation bar button

```swift
.navigationBarItems(trailing:
    Button(action: calculateBedtime) {
        Text("Calculate")
    }
)
```

# Connecting SwiftUI to Core ML

- Our model file's name is `SleepCalculator.mlmodel`, which means that Xcode will auto-generate a class called `SleepCalculator` that we can use in our code as simply as this: 

```swift
let model = SleepCalculator()
```

# Cleaning up the user interface

- If we were to define a computed property like this:

```swift
var defaultWakeTime: Date {
    var components = DateComponents()
    components.hour = 7
    components.minute = 0
    return Calendar.current.date(from: components) ?? Date()
}
```

and then try to assign it to a @State property

```swift
@State private var wakeUp = defaultWakeTime
```

this wouldn't compile because there's no guarantee that `defaultWakeTime` will be initialized before `wakeUp`.

- We can workaround this issue by making the `defaultWakeTime` property static.
