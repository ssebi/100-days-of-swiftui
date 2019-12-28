# Day 93 - Project 18, Part Two

🔗 [HWS Day 93](https://www.hackingwithswift.com/100/swiftui/93)


# 📝 Notes

Covered topics:

- Absolute positioning for SwiftUI views
- Understanding frames and coordinates inside GeometryReader
- ScrollView effects using GeometryReader

# Absolute positioning for SwiftUI views

- In SwiftUI we have two choices when it come to positioning views: `offset` and `position`. By using `offset` we achieve what's called relative positioning and by using `position` we achieve absolute positioning.

# Understanding frames and coordinates inside GeometryReader

- When using a `GeometryReader` you'll notice that it stretches to take up more space than needed. That is because the view that gets returned has a `flexible preferred size`
- We can read the frame of the view using `GeometryReader's` `frame(in:)` method which takes three possible values: `global`, `local` or `named`.
- The `x` and `y` coordinates can have different values depending on how you want to look at them. SwiftUI calls them `coordinate spaces`. The global coordinate space means that x and y values are absolute and local means they are within the view's parent. You can also have a custom coordinate space using the `.coordinateSpace(name:)` modifier.

>
Which coordinate space you want to use depends on what question you want to answer:
>
- Want to know where this view is on the screen? Use the global space.
- Want to know where this view is relative to its parent? Use the local space.
- What to know where this view is relative to some other view? Use a custom space.

# ScrollView effects using GeometryReader

- Using the `GeometryReader` we can grab dynamic values from a view's environment and we can also nest them allowing us to create cool effects while scrolling.