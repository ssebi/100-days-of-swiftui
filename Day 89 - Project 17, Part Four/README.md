# Day 89 - Project 17, Part Four

🔗 [HWS Day 89](https://www.hackingwithswift.com/100/swiftui/89)

🔗 [Resources] (https://github.com/twostraws/HackingWithSwift)


# 📝 Notes

Covered topics:

- Coloring views as we swipe
- Counting down with a Timer
- Ending the app with allowsHitTesting()



# Coloring views as we swipe

- An extra feature has been added to our project. Swiping left colors the card red and swiping right colors it green marking a wrong or a correct answer. The trick is that it also needs to work when choosing the *Differentiate Without Color* setting. So if that is enabled, we no longer color the cards and we show two images on the bottom left and right indicating that swiping left means the answer is wrong and swiping right means it's correct.

# Counting down with a Timer

- Now we've just added a timer so that the users feel a little bit of pressure. The timer starts at 100 seconds and it goes down to 0. However there's something not working quite well: When going to the home screen, the timer still runs in the background for a few seconds (about 3 seconds). To fix that we've added a new property `isActive` that is set to `false` when the `UIApplication.willResignActiveNotification` is triggered.

# Ending the app with allowsHitTesting()

- To disable user interaction when the timer runs out, we've used the `allowsHitTesting` modifier:

```swift
.allowsHitTesting(timeRemaining > 0)
```

- Additionally, we've added a reset button and we've fixed a few bugs.