# Day 82 - Project 16, Part Four

🔗 [HWS Day 82](https://www.hackingwithswift.com/100/swiftui/82)

# 📝 Notes

Covered topics:

- Building our tab bar
- Sharing data across tabs using @EnvironmentObject
- Dynamically filtering a SwiftUI List

# Building our tab bar

- For the Tab Bar, we've created two `SwiftUI Views`. The trick is that one of the Views will actually represent the views for three of the tab bars. We've added an `enum` to disambiguate between them.

# Sharing data across tabs using @EnvironmentObject

- We've stored an array of prospects in the ContentView and added it to the `environmentObject` of the Tab bar. Because all the views inside a Tab bar are considered children of the Tab bar, now we can access the prospects from the `@EnvironmentObject` at any time in the `ProspectsView` struct. Now if any changes are happening to the prospects they will be propagated to the children causing their `body` property to get updated. Pretty cool.

# Dynamically filtering a SwiftUI List

- We've added a computed property that filters the prospects array to display the right data depending on the type of the `ProspectsView`. 