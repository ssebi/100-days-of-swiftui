# Day 41 - Project 8: Moonshot, Part Three
🔗 [HWS Day 41](https://www.hackingwithswift.com/100/swiftui/41)
🔗 [Resources](https://github.com/twostraws/HackingWithSwift)

# 📝 Notes
Covered topics:

- Showing mission details with ScrollView and GeometryReader
- Merging Codable structs using first(where:)
- Fixing problems with buttonStyle() and layoutPriority()

# Showing mission details with ScrollView and GeometryReader

- To add some minimum spacing to a `Spacer` view we could write this `Spacer().frame(minHeight: 25)`, but we could also write `Spacer(minLength: 25)`. The latter is probably better since it gives the expected result both for `HStack` and `VStack`.

# Merging Codable structs using first(where:)

- Here we've seen a new technique that uses the `init()` method to customize a view's properties. We've also seen one of the most common things we have to deal with in our programming lives: manipulating data so it makes sense for the end-users.

# Fixing problems with buttonStyle() and layoutPriority()

- We've now completed the app by also adding another link to view details about the astronaut. 
- We can let some views take up more space than other by defining the `.layoutPriority()`. By default they all have `0`.
- The `NavigationLink` automatically tints the source to blue, but we can disable that by adding the following modifier `.buttonStyle(PlainButtonStyle())`.