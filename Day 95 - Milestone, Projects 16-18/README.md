# Day 95 - Milestone: Projects 16-18

🔗 [HWS Day 95](https://www.hackingwithswift.com/100/swiftui/95)


# 📝 Notes

Covered topics:

- What you learned
- Key points
- Challenge

# What you learned

>
- Reading environment values using @EnvironmentObject.
- Creating tabs with TabView.
- Using Swift’s Result type to send back success or failure.
- Manually publishing ObservableObject changes using objectWillChange.send().
- Controlling image interpolation.
- Placing buttons in a ContextMenu.
- Creating local notifications with the UserNotifications framework.
- Using third-party code with Swift package dependencies.
- Using map() and filter() to create new arrays based on an existing one.
- How to create dynamic QR codes.
- Attaching custom gestures to a SwiftUI view.
- Using UINotificationFeedbackGenerator to make iPhones vibrate.
- Disabling user interactivity using allowsHitTesting().
- Triggering events repeatedly using Timer, or by receiving events from NotificationCenter.
- Supporting color blindness, reduced motion, and more.
- Using NavigationView in landscape with StackNavigationViewStyle.
- SwiftUI’s three step layout system.
- Alignment, alignment guides, and custom alignment guides.
- Absolutely positioning views using the position() modifier.
- Using GeometryReader and GeometryProxy to make special effects.

# Key points

- We've taken a deeper look into *functional programming* and the `Result` type. [https://www.hackingwithswift.com/guide/ios-swiftui/7/2/key-points](https://www.hackingwithswift.com/guide/ios-swiftui/7/2/key-points)

# 🎯 Challenge

## 📐 Work in Progress
>
Your challenge this time can be easy or hard depending on how far you want to take it, but at its core the project is simple: you need to build an app that helps users roll dice then store the results they had.

>
At the very least you should have a tab view where the first tab lets users roll dice, and the second tab shows results from previous rolls. However, if you want to push yourself further you can try one or more of the following:

>
Let the user customize the dice that are rolled: how many of them, and what type: 4-sided, 6-sided, 8-sided, 10-sided, 12-sided, 20-sided, and even 100-sided.
Show the total rolled on the dice.
Store the results using Core Data so they are persistent.
Add haptic feedback when dice are rolled.
For a real challenge, make the value rolled by the dice flick through various possible values before settling on the final figure.
When I say “roll dice” you don’t need to create fancy 3D effects – just showing the numbers that were “rolled” is fine.

>
The only thing that might cause you some work is step 5: making the results flick through various values before settling on the final figure. The easiest way to tackle this is through a Timer that gets cancelled after a certain number of calls, but if you wanted a more advanced solution you could try calling DispatchQueue.main.asyncAfter() with increasing delays so it starts faster than slows down as the “dice roll” slows down.

>
While you’re working, please take a moment to remember the accessibility of your code – try using it with VoiceOver and make sure it works as well as you can make it.
