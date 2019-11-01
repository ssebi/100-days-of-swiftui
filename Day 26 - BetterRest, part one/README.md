# Day 26 – Project 4: BetterRest, Part One
🔗 [HWS Day 26](https://www.hackingwithswift.com/100/swiftui/26)

🔗 [Resources](https://github.com/twostraws/HackingWithSwift)

# 📝 Notes
Covered topics:

- BetterRest: Introduction
- Entering numbers with Stepper
- Selecting dates and times with DatePicker
- Working with dates
- Training a model with Create ML

# BetterRest: Introduction

- In this project we'll be introduced to Apple's machine learning framework, `Core ML`. The app is designed to help those who drink coffee get a good night sleep. 

# Entering numbers with Stepper

- To create a `Stepper`, we just need a @State property to hold our value

```swift 
@State private var sleepAmount = 8.0
```

- Then, we can bind that value to a `Stepper` like this:

```swift
Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
    Text("\(sleepAmount) hours")
}
```

# Selecting dates and times with DatePicker

- As with the stepper, we first need a @State property:

```swift
@State private var wakeUp = Date()
```

- And then we can use it like this:

```swift
    DatePicker("Please enter a date", selection: $wakeUp, in: Date()...)
```

- The above example creates a `DatePicker` that doesn't allow the selection of dates before today.
- The label is a little bit glitched so we can simply hide it by using the `.labelsHidden()` modifier.

# Working with dates

- Working with dates is hard, so we should rely on Apple's frameworks for that. That's because it takes care of daylight savings, leap seconds and different calendars. 
- We can use code like this to create a custom time:

```swift
var components = DateComponents()
components.hour = 8
components.minute = 0
let date = Calendar.current.date(from: components)
```

# Training a model with Create ML

- Machine learning has evolved over the years to be really powerful and easy to use with the introduction of Core ML. In this project we're going to use tabular regression. 