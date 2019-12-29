# Day 97 - Project 19, Part Two

🔗 [HWS Day 97](https://www.hackingwithswift.com/100/swiftui/97)

🔗 [Resources] (https://github.com/twostraws/HackingWithSwift)


# 📝 Notes

Covered topics:

- Building a primary list of items
- Making NavigationView work in landscape
- Creating a secondary view for NavigationView


# Building a primary list of items

- We've loaded the resources and built the list of resorts but it doesn't yet work in landscape.
- Note that declaring `static let` properties automatically makes them lazy so they will only be loaded when they're being accessed.

# Making NavigationView work in landscape

- Now we've also added a view to show on the right side. That view also indicates the the user should swipe right to reveal the list of resorts. 
- SwiftUI doesn't provide any way of indicating the users that they can swipe to reveal the left view that's why we have to instruct them using labels or by defaulting to presenting the primary view in landscape. That can be done easier using the following extension:

```swift
extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }
}
```

- It just has to be applied to the `NavigationView` as a modifier.

# Creating a secondary view for NavigationView

- The last step was to add a Details View to show the selected resort details. We've also used `ListFormatter` to present the list of facilities in a way that is more natural to read.