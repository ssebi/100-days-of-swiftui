# Day 90 - Project 17, Part Five

🔗 [HWS Day 90](https://www.hackingwithswift.com/100/swiftui/90)

🔗 [Resources] (https://github.com/twostraws/HackingWithSwift)


# 📝 Notes

Covered topics:

- Making iPhones vibrate with UINotificationFeedbackGenerator
- Fixing the bugs
- Adding and deleting cards

# Making iPhones vibrate with UINotificationFeedbackGenerator

- In this part where we've added some haptic feedback to the  app, we've also learnt that the Taptic engine needs some warming up before it's being used so that the delay between when we call `play` and the effect happening is low. Not calling `prepare` might cause inconsistencies and because we're talking about haptics, the feedback needs to  happen instantly. We've also learnt that is totally fine to call `prepare` many times even if it's directly followed by a `play` function call because the system is doing performance optimizations for us.

# Fixing the bugs

- We've took some time to fix a couple of bugs in the app. Some of them were bugs in our logic but there were also accessibility related bugs and with just a few lines of code we've greatly improved our app's accessibility.
- Something to notice is that SwiftUI doesn't have a way of letting us know VoiceOver is being used. The closest thing  we can observe is if accessibility is enabled:

```swift
@Environment(\.accessibilityEnabled) var accessibilityEnabled
```

# Adding and deleting cards

- To conclude this project, we've added a new view where we can add our own cards and remove the ones that we no longer need.
- Interesting enough, be default when turning a phone in landscape mode SwiftUI displays the `detailView`. That means we'll see a blank white screen and only if we drag from the left we see our screen. To override this presentation we need to call the following modifier:

```swift
.navigationViewStyle(StackNavigationViewStyle())
```