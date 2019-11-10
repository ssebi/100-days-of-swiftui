# Day 39 - Project 8: Moonshot, Part One
🔗 [HWS Day 39](https://www.hackingwithswift.com/100/swiftui/39)

# 📝 Notes
Covered topics:

- Moonshot: Introduction
- Resizing images to fit the screen using GeometryReader
- How ScrollView lets us work with scrolling data
- Pushing new views onto the stack using NavigationLink
- Working with hierarchical Codable data

# Moonshot: Introduction

>
In this project we’re going to build an app that lets users learn about the missions and astronauts that formed NASA’s Apollo space program.

# Resizing images to fit the screen using GeometryReader

 - `Image` views automatically adjusts their frame to fit the size of its contents but that's not always what we want. To change the content size of an `Image` view, we have to use the `.resizable()` modifier.
 - An even cooler way to size an `Image` view is to use the `GeometryReader`

```swift
VStack {
    GeometryReader { geo in
        Image("Example")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: geo.size.width, height: 300)
    }
}
```

 - The code above will make the `Image` automatically fill the whole width and adjust its height accordingly to keep the content's aspect ratio.

# How ScrollView lets us work with scrolling data

 - If we want to create a scrollable list of custom views created by us we can use the `ScrollView`. It will automatically update it's content size depending on the views we place inside it.
 - One big difference between a `ScrollView` and a `List` is that the views added to the `ScrollView` gets created immediately, not just when the user scrolls so they are visible on the screen.

# Pushing new views onto the stack using NavigationLink

 - We can *push* a new view to the navigation stack by using a `NavigationLink`. This type of navigation is different than `sheet`, letting the users know they've gone deeper into the view hierarchy:

```swift
        NavigationLink(destination: Text("Detail View")) {
            Text("Hello World")
        }
```

# Working with hierarchical Codable data

 - Here we've seen how we can decode nested `JSON data` by writing matching `structs` in our code.