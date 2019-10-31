# Day 21 – Project 2: Guess the Flag, Part Two
🔗 [HWS Day 21](https://www.hackingwithswift.com/100/swiftui/21)

# 📝 Notes
Covered topics:

- Stacking up buttons
- Showing the player’s score with an alert
- Styling our flags

# Stacking up buttons

- By using the `.renderingMode(.original)` modifier you make sure images will keep their original color.
- Nesting Stacks on many levels is perfectly normal.

# Showing the player’s score with an alert

- Here we just put into practice what we've learnt on day 20 about alerts.

# Styling our flags

- You can change the font and font weight by using `.font()` and `.fontWeight()` modifiers. Using fonts like `.largeTitle` enables `dynamic font size` which means users will be able to dynamically increase or decrease the fonts in your app.
- You can use the `clipShape()` modifier to clip Views. One cool option is the `Capsule()`
- Use `stroke()` modifier to draw a stroke around the View.
- To add a shadow use the `shadow()` modifier.
- The below example gives some pretty cool results with just a few lines of code:

```swift
Image(self.countries[number])
    .renderingMode(.original)
    .clipShape(Capsule())
    .overlay(Capsule().stroke(Color.black, lineWidth: 1))
    .shadow(color: .black, radius: 2)
```