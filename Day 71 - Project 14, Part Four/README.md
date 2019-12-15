# Day 71 - Bucket List, Part Four

🔗 [HWS Day 71](https://www.hackingwithswift.com/100/swiftui/71)

# 📝 Notes

Covered topics:

- Extending existing types to support ObservableObject
- Downloading data from Wikipedia
- Sorting Wikipedia results

# Extending existing types to support ObservableObject

- We've learnt yet another useful technique to help us deal with the fact that `SwiftUI` doesn't let us use `Optionals` with its `TextFields`. So we created a new extension on the `MKPointAnnotation` class and added two new properties `wrappedTitle` and `wrappedSubtitle` to always return a String, not an optional.
- So now, in our project we can also edit the annotations

# Downloading data from Wikipedia

- We've downloaded some suggestions from Wikipedia and we've also used an enum to represent the loading state.

# Sorting Wikipedia results

- To make Wikipedia results a little more useful we've also implemented the `Comparable` protocol on the `Page` struct.