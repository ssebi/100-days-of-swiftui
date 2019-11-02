# Day 20 – Project 2: Guess the Flag, Part One
🔗 [HWS Day 20](https://www.hackingwithswift.com/100/swiftui/20)

# 📝 Notes
Covered topics:

- Guess the Flag: Introduction
- Using stacks to arrange views
- Colors and frames
- Gradients
- Buttons and images
- Showing alert messages

# Guess the Flag: Introduction

As the name says, this is a flag guessing game. The purpose of this game is to help users learn some of the flags in this world. In terms of SwiftUI, we're going to learn about `stacks`, `buttons`, `images`, `alerts`, `asset catalogs`, and more.

Additional files needed for this project can be downloaded here [https://github.com/twostraws/HackingWithSwift](https://github.com/twostraws/HackingWithSwift)

# Using stacks to arrange views

- The `some view` opaque type forces us to return only one certain type that conforms to the `View` protocol. But in order to return multiple things we need to wrap them in another type of view, as a `HStack`, `VStack` or `ZStack`.

```swift
var body: some View {
    VStack {
        Text("Hello World")
        Text("This is inside a stack")
    }
}
```

- We can use the `spacing` property to add some spacing `VStack(spacing: 20)`; Or we could use the `alignment` property to change the alignment like so `VStack(alignment: .leading)`.

- If we add a `Spacer()` inside the `VStack`, that will take all available space and push the other components aside.

# Colors and frames

```swift
ZStack {
    Text("Your content")
}
.background(Color.red)
```

- The code above adds a red background behind the text, but if you wanted to add that red background to the whole screen you would have to type something like this instead:

```swift
 ZStack {
        Color.red
        Text("Your content")
    }
```

- `Color` is actually also a View type. 

- Semantic colors describe what they are representing rather than the color. For instance, `Color.primary` is the default color for text which is black when running in light mode and white when running in dark mode.

- In order to make a view stretch all the way, including safe areas, you can use the `.edgesIgnoringSafeArea(.all)` modifier.

# Gradients

- We can draw Gradients like this (there are three types):

```swift
LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
```

```swift
RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
```

```swift
AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
```

# Buttons and images

- The simplest way to write a button in SwiftUI is this:

```swift
Button("Tap me!") {
    print("Button was tapped")
}
```
- If you need more control and customization there's also this way:

```swift
Button(action: {
    print("Button was tapped")
}) { 
    Text("Tap me!")
}
```

- If you don't want the screen reader to read your image, use the `Image(decorative:)` initializer.
- You can add an image and text to a button like this:

```swift
Button(action: {
    print("Edit button was tapped")
}) {
    HStack(spacing: 10) { 
        Image(systemName: "pencil")
        Text("Edit")
    }
}
```

# Showing alert messages

- Presenting an alert in SwiftUi is pretty interesting because you need a `@State` property of type `Bool` that tells the alert when to show. Then you can simply "attach" the alert to a View.

```swift
struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        Button("Show Alert") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
        }
    }
}
```

- Note that when dismissed, it will automatically set the boolean to `false`.