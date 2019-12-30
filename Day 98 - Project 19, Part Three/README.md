# Day 98 - Project 19, Part Three

🔗 [HWS Day 98](https://www.hackingwithswift.com/100/swiftui/98)

🔗 [Resources] (https://github.com/twostraws/HackingWithSwift)


# 📝 Notes

Covered topics:

- Changing a view’s layout in response to size classes
- Binding an alert to an optional string
- Letting the user mark favorites

# Changing a view’s layout in response to size classes

- We've started the last part of the project by changing the layout depending on the size classes.
- Size classes only tell us if we have less or more space available:

>
- All iPhones in portrait have compact width and regular height.
- Most iPhones in landscape have compact with and compact height.
- Large iPhones (Plus-sized and Max devices) in landscape have regular width and compact height.
- All iPads in both orientations have regular with and regular height.

- We've wrapped `SkiDetailsView` and `ResortDetailsView` in a `Group` to make the m layout neutral and let the parent decide how they should be displayed.
- We've noticed that in some cases even if there is enough place of a text, it will spread on two lines. That is because `Spacers` have priority. To fix that we had to add `.layoutPriority(1)` to the texts.

# Binding an alert to an optional string

- Secondly, we replaced the facilities strings with icons and we've added an alert that displays the facility title and a short description when tapped. We show the alert when the optional value changes which means our `Facility` needs to conform to `Identifiable` and there are two options for doing that: 
	- we could add a small extension making all `Strings` identifiable which works fine as long as we remember we can't use duplicate strings:

		```swift
		extension String: Identifiable {
			public var id: String { self }
		}
		```
	- the second option is to add an extra property to the `Facility` class, `id` which is an instance of `UUID`. Because of that we also have to let go of the `static` convenience properties that we previously had.

# Letting the user mark favorites

- The last touch to this project was adding the possibility to mark favorites. So we've added a new class called `Favorites` that holds the array of favorite resorts and calls `objectWillChange.send()` when the array is being modified. We've also added it to the `.environmentObject` so that all child views can access the list.