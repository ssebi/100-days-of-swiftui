# Day 36 - Project 7: iExpense, Part One
🔗 [HWS Day 36](https://www.hackingwithswift.com/100/swiftui/36)

# 📝 Notes
Covered topics:

- iExpense: Introduction
- Why @State only works with structs
- Sharing SwiftUI state with @ObservedObject
- Showing and hiding views
- Deleting items using onDelete()
- Storing user settings with UserDefaults
- Archiving Swift objects with Codable

# iExpense: Introduction

- Now we're starting to get more serious and push our SwiftUI skills beyond the basics.
>
In this project we’re going to build iExpense, which is an expense tracker that separates personal costs from business costs

# Why @State only works with structs

 - Because of the way @State property wrapper is designed to watch for changes, it can only work with structs. There's no compile error but the `body` property just won't be invoked again, so changes cannot be seen. What SwiftUI does when we change a property, is it actually recreates the while struct but with the change in place and @State listens for that change. In the case of classes, it doesn't get re-created so @State doesn't pick up any change.
 - @State is designed for local state, related to a single View.
 - The point is, for cases where we are not just looking for isolated state, we need other property wrappers.

# Sharing SwiftUI state with @ObservedObject

- In the case where we want to share state between multiple views, we'll want to be able to observe changes on `classes` too, the same way we can on `structs`. 
- We can do that by following three simple steps:
	- We need to make the class conform to the `ObservableObject` protocol.
	- We need to add the `@Published` property wrapper to the properties that we want to *expose* inside the class.
	- Finally, we need to add the `@ObservedObject` property wrapper to the property when we declare it in a View.

# Showing and hiding views

- One of the several ways to display other views in SwiftIUI is a `sheet` (a view presented modally in UIKit). It's basically a view presented on top of an already existing one. 
- Showing a `sheet` view is very similar to showing an `alert`. That means we first need a Bool @State property first which indicates whether the `sheet` is being presented or not. Then we add it to any view like this:

```swift
.sheet(isPresented: $showingSheet) {
    // contents of the sheet
}
```

- In order to dismiss the view presented with a `sheet`, we can read the view's presentation mode from the environment and call `dismiss()` on it. To do that we need to use yet another property wrapper called `@Environment`

```swift
@Environment(\.presentationMode) var presentationMode
```

- Note that the `presentationMode` is actually a binding so it can be updated by the system

# Deleting items using onDelete()

- `onDelete` modifier only works with `ForEach` and it gives us back the index of the items that the user wants to remove.

# Storing user settings with UserDefaults

 - We can save small amount of data in the `UserDefaults` which will be loaded when the app starts. In most cases we'll use `UserDefaults.standard` but if we want to share defaults across several app extensions we could. create our own `UserDefaults` instance.

# Archiving Swift objects with Codable

- We can easily archive our data by conforming to `Codable` protocol as long as our data can be archived. We'll get a compile error if it can't.
- Then we can use `JSONEncoder` to encode data and `JSONDecoder` to decode it.