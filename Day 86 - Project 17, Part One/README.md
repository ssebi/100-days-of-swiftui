# Day 86 - Project 17, Part One

🔗 [HWS Day 86](https://www.hackingwithswift.com/100/swiftui/86)

# 📝 Notes

Covered topics:

- Flashzilla: Introduction
- How to use gestures in SwiftUI
- Making vibrations with UINotificationFeedbackGenerator and Core Haptics
- Disabling user interactivity with allowsHitTesting()

# Flashzilla: Introduction

>
In this project we’re going to build an app that helps users learn things using flashcards – cards with one thing written on such as “to buy”, and another thing written on the other side, such as “comprar”. Of course, this is a digital app so we don’t need to worry about “the other side”, and can instead just make the detail for the flash card appear when it’s tapped.

# How to use gestures in SwiftUI

- Gestures are great to make fluid and interesting interfaces. We've already used the `onTapGesture`, there's also `onLongPressGesture` but for more advanced gestures we can use the gesture structs such as: `DragGesture`, `LongPressGesture`, `MagnificationGesture`, `RotationGesture` and `TapGesture`. They usually have `.onEnded` and `.onChanged` modifiers.
- When there are multiple gestures that might be recognized in the same time we can use the `.highPriorityGesture` to change which one gets recognized or use `.simultaneousGesture` to recognize them both.
- One even more advanced example is to sequence multiple gestures together to create complex use-cases such as being able to drag a view only if you long-press on it before.

# Making vibrations with UINotificationFeedbackGenerator and Core Haptics

- In UIKit haptics are very simple and they indicate success, warning or failure. Using them is as simple as this:

```swift
let generator = UINotificationFeedbackGenerator()
generator.notificationOccurred(.success)
```

- In iOS 13, Apple introduces a new framework for more advanced haptics called `Core Haptics`. Using the more advanced haptics you can customize the `intensity` and the `sharpness` of those haptics to create unique patterns.

# Disabling user interactivity with allowsHitTesting()

- SwiftUI's hit testing is pretty advanced. Setting the `allowsHitTesting(enabled:)` modifier to `false` will cause the view to refuse responding to gestures. If there are views behind, those will receive the gestures.
- The interesting part is that we can control the tap area of a view with the `.contentShape(shape:)` modifier. This can be useful for example if there's a `VStack` with some `Text` and a `Spacer` between the text. In this case tapping inside the `Spacer` won't trigger an attached tap gesture. We can fix that by adding the `.contentShape(Rectangle())` modifier. Now the whole `VStack` is tappable, even the space between the text:

```swift
VStack {
    Text("Hello")
    Spacer().frame(height: 100)
    Text("World")
}
.contentShape(Rectangle())
.onTapGesture {
    print("VStack tapped!")
}
```