# Day 43 - Project 9: Drawing, Part One
🔗 [HWS Day 43](https://www.hackingwithswift.com/100/swiftui/43)

# 📝 Notes
Covered topics:

- Drawing: Introduction
- Creating custom paths with SwiftUI
- Paths vs shapes in SwiftUI
- Adding strokeBorder() support with InsettableShape

# Drawing: Introduction

In this project we're going to focus on drawing: creating custom paths and shapes. We'll use both Core Animation and Metal frameworks for that

# Creating custom paths with SwiftUI

- Drawing paths can be achieved in SwiftUI like this. But not that it's positions doesn't depend on the screen size so it might not look good on all devices:

```swift
Path { path in
    path.move(to: CGPoint(x: 200, y: 100))
    path.addLine(to: CGPoint(x: 100, y: 300))
    path.addLine(to: CGPoint(x: 300, y: 300))
    path.addLine(to: CGPoint(x: 200, y: 100))
    path.addLine(to: CGPoint(x: 100, y: 300))
}
```

- We can use `StrokeStyle` to gain more control over how we want to stroke a shape:

```swift
.stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
```

# Paths vs shapes in SwiftUI

- In contrast to `Path` we can also draw custom shapes using `Shape` but they don't have fixed coordinates.
- Paths are designed to do specific things and Shapes have more flexibility. We can also add custom parameters to help us draw them. This is how we would draw a triangle:

```swift
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}
```

# Adding strokeBorder() support with InsettableShape

- By using `.strokeBorder()`, SwiftUI strokes the inside of the shape. By default the border is centered on the line.
- All shapes that conform to `InsettableShape` can use the `.strokeBorder()` modifier.