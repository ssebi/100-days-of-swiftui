# Day 62 - Project 13, Part One

🔗 [HWS Day 62](https://www.hackingwithswift.com/100/swiftui/62)

# 📝 Notes

Covered topics:

- Instafilter: Introduction
- How property wrappers become structs
- Creating custom bindings in SwiftUI
- Showing multiple options with ActionSheet

# Instafilter: Introduction

It's time for a new project, this time is a photos editing app which lets users import photos from their library and add different types of effects to them. 

We're going to learn a very useful skill in this project, and that's integrating `UIKit` in `SwiftUI`. We need this because not all Apple's APIs have `SwiftUI` wrappers written.

# How property wrappers become structs

You might have noticed that writing something like this:

```swift
@State private var blurAmount: CGFloat = 0 {
    didSet {
        print("New value is \(blurAmount)")
    }
}
```

doesn't work in `SwiftUI` as you might expect and nothing will be printed in the console. The reason for that is because how `Property Wrappers` work. When we change the `blurAmount`, it actually changes the internal value. In our `didSet` however, we're observing changes on the `State`, not the internal value and that is why we don't get anything printed out in the console, because the `State` itself doesn't change, only its internal value does.

# Creating custom bindings in SwiftUI

To fix the previously presented issue, we have to use something that's that's called `Custom Bindings`. 

```swift
struct ContentView: View {
    @State private var blurAmount: CGFloat = 0

    var body: some View {
        let blur = Binding<CGFloat>(
            get: {
                self.blurAmount
            },
            set: {
                self.blurAmount = $0
                print("New value is \(self.blurAmount)")
            }
        )

        return VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)

            Slider(value: blur, in: 0...20)
        }
    }
}
```

Note that now we're not relying on the `Two way binding` we normally do using the `$`. Now we just pass in our custom binding to the `Slider` value parameter.

# Showing multiple options with ActionSheet

Adding an `ActionSheet` is pretty straight-forward:

```swift
struct ActionSheetExample: View {
    @State private var showingActionSheet = false
    @State private var backgroundColor = Color.white

    var body: some View {
        Text("Hello, World!")
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            .onTapGesture {
                self.showingActionSheet = true
        }
        .actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(title: Text("Change background"), message: Text("Select a new color"), buttons: [
                .default(Text("Red")) { self.backgroundColor = .red },
                .default(Text("Green")) { self.backgroundColor = .green },
                .default(Text("Blue")) { self.backgroundColor = .blue },
                .cancel()
            ])
        }
    }
}
```