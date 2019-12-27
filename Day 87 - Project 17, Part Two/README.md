# Day 87 - Project 17, Part Two

🔗 [HWS Day 87](https://www.hackingwithswift.com/100/swiftui/87)

# 📝 Notes

Covered topics:

- Triggering events repeatedly using a timer
- How to be notified when your SwiftUI app moves to the background
- Supporting specific accessibility needs with SwiftUI

# Triggering events repeatedly using a timer

- `@Published` and `ObservableObject` are actually coming from `Combine` framework. We haven't noticed this because it's actually imported implicitly when we import `SwiftUI`. `Combine` adds an extension on `Timer` to make them behave like *publishers* and announce when they change. 
- We can write a timer using this code:

```swift
let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
```

- *Publishers* like the `Timer` can be used within the completion block of the `onReceive()` modifier.
- To stop the timer we need to use this code:

```swift
self.timer.upstream.connect().cancel()
```

- Additionally, we can have some *tolerance* so that the operating system can do some optimizations. Even if no *tolerance* is specified, that doesn't mean that it's absolutely accurate. It just means that it will be as accurate as possible.

```swift
let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
```

# How to be notified when your SwiftUI app moves to the background

- Using Apple's `Notification Center` which is coming from the `Foundation` framework we can see all listen to all kinds of changes, such as app going in background, coming back in foreground, user taking a screenshot, keyboard appearing or disappearing and many others. `Combine` adds publishers for all of them and we can get notified using code similar to this:

```swift
Text("Hello, World!")
    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
        print("Moving to the background!")
    }
```

# Supporting specific accessibility needs with SwiftUI

- Besides the Accessibility features we've seen in Project 15 there are custom accessibility settings which are provided through the environment so the UI will update. Here's a few of them: `accessibilityDifferentiateWithoutColor` which means that UI shouldn't be dependent on color such as having a green button signaling success, `accessibilityReduceMotion` which means that no animations should be performed, or `accessibilityReduceTransparency` which means that we should not have too much transparency in our UI.