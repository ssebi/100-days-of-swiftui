# Day 96 - Project 19, part One

🔗 [HWS Day 96](https://www.hackingwithswift.com/100/swiftui/96)


# 📝 Notes

Covered topics:

- SnowSeeker: Introduction
- Working with two side by side views in SwiftUI
- Using alert() and sheet() with optionals
- Using groups as transparent layout containers

# SnowSeeker: Introduction

- In this project we’re going to create SnowSeeker: an app to let users browse ski resorts around the world, to help them find one suitable for their next holiday.

# Working with two side by side views in SwiftUI

- In UIKit there is a class called `UISplitViewController` that we can use to create complex layouts involving two side-by-side views to benefit from the extra space available on iPads. In SwiftUI there's no such class, but the `NavigationView` itself can have two views. That's why  when we have a `NavigationView` with only one view and we turn the phone into landscape, we just see a blank screen. If we were to add a second view, we would've seen that.

- However, there are a few drawbacks with this approach that  should be fixed in future versions of SwiftUI:

>
- Your initial secondary view isn’t given a navigation bar at the top, so even though you’re able to set a title nothing will appear.
- Subsequent detail views always get a navigation bar whether you want it or not, so you need to use navigationBarHidden(true) to hide it.
- There’s no way of making the primary view stay visible on iPad even when there is more than enough space.
- There’s no way of having a Menu button appear in the navigation bar of the secondary view, to make the primary view more discoverable.
- You can’t make the primary view shown in landscape by default; SwiftUI always chooses the detail.

# Using alert() and sheet() with optionals

- There's another way of presenting `alerts` and `sheets`: We can use an optional `Identifiable` object as the condition and when the optional has a value, the alert or sheet will be presented. 

# Using groups as transparent layout containers

- Besides of the 10-children limit work around, `Group` has another behavior: it acts as a transparent layout container. That means we can have a couple of views inside a `Group` that we can later on embed in different stacks to obtain different behaviors depending on our needs. For example we might use a `VStack` for `.compact sizeClass` and a `HStack` otherwise:

```swift
struct ContentView: View {
    @Environment(\.horizontalSizeClass) var sizeClass

    var body: some View {
        Group {
            if sizeClass == .compact {
                VStack(content: UserView.init)
            } else {
                HStack(content: UserView.init)
            }
        }
    }
}
```