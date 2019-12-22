# Day 79 - Project 16, Part One

🔗 [HWS Day 79](https://www.hackingwithswift.com/100/swiftui/79)

# 📝 Notes

Covered topics:

- Hot Prospects: Introduction
- Reading custom values from the environment with @EnvironmentObject
- Creating tabs with TabView and tabItem()

# Hot Prospects: Introduction

>
In this project we’re going to build Hot Prospects, which is an app to track who you meet at conferences. You’ve probably seen apps like it before: it will show a QR code that stores your attendee information, then others can scan that code to add you to their list of possible leads for later follow up.

# Reading custom values from the environment with @EnvironmentObject

- Until now we've used `ObservableObject` and the `@Published` property wrapper to share objects between classes. But there's one downside to this approach: When we have deeper view hierarchies we need to pass these objects from one view to the other. The other option is to use the `@EnvironmentOjbect` property wrapper so that all children of one view will have access to the same objects without any extra work form our side. Be careful though, if you don't pass the object yourself using the `environmentObject(bindable:)` access modifier and try to access it the app will simply crash. One other thing to be careful at, is that modally presented views don't have access to the same `@EnvironmentOjbect` as the view they've been presented from.
- In order for `SwiftUI` to keep objects in sync for us, it used  the `KeyValuePairs` type internally with our custom types as keys and the objects themselves as values.

# Creating tabs with TabView and tabItem()

- To add a tab bar to our app we can use the `TabView` struct in combination with its `tabItem` modifier that enables us to customize the tab bar items. 
- Changing tabs manually is a little bit trickier because it requires you to have a `@State` property that stores the currently selected tab and bind it to the `TabView`. Additionally, you have to tag each tab using the `tag(tag:)` access modifier.