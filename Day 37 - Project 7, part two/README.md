# Day 37 - Project 7: iExpense, Part Two
🔗 [HWS Day 37](https://www.hackingwithswift.com/100/swiftui/37)

# 📝 Notes
Covered topics:

- Building a list we can delete from
- Working with Identifiable items in SwiftUI
- Sharing an observed object with a new view
- Making changes permanent with UserDefaults
- Final polish

# Building a list we can delete from

 - After we've modeled our data using the `@ObservedObject` to store expenses instead of @State as we did in previous projects and added basic UI we've noticed that when any of the items in the list are removed, the last row is being removed always.

# Working with Identifiable items in SwiftUI

- The last row is removed because we've said that the items in the array are identified uniquely by their name. But in our case, all items have the same name which means that Swift will take the easiest approach and remove the last item from the array.
- To fix this issue we need to uniquely identify each object and we do that by generating a new `UUID` every time we create an `Expense`. Additionally, if we make the `Expense` struct conform to the `Identifiable` protocol we can omit the `id` parameter in the `ForEach`.

# Sharing an observed object with a new view

- In this part, we create the `AddView` view that will be presented as a `sheet` and its purpose will be to create an expense, then save it in the expenses array. For that reason we add the `@ObservedObject var expenses` in here too, and we pass it in when we create the view, at the press of the + button.

# Making changes permanent with UserDefaults

- Now the app is really starting to come together. We've added a button to save the new expense in the `AddView` and we've also stored the expenses in the `UserDefaults`.

# Final polish

- Now we've also added some final touches. We now dismiss the `sheet` after we tap the save button and we also show all the details in the list.

