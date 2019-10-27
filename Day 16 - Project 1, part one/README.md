# Day 16: Project 1: WeSplit, Part One
🔗 [HWS Day 16](https://www.hackingwithswift.com/100/swiftui/16)
## 📝 Notes
On this day we are covering the following topics:

- WeSplit: Introduction
- Understanding the basic structure of a SwiftUI app
- Creating a form
- Adding a navigation bar
- Modifying program state
- Binding state to user interface controls
- Creating views in a loop

All projects follow the following structure:

- A hands-on introduction to all the techniques you’ll be learning.
- A step-by-step guide to build the project.
- Challenges for you to complete on your own, to take the project further.

# Introduction
What we're building?
> In this project we’re going to be building a check-splitting app that you might use after eating at a restaurant – you enter the cost of your food, select how much of a tip you want to leave, and how many people you’re with, and it will tell you how much each person needs to pay.

# Understanding the basic structure of a SwiftUI app
> - `SceneDelegate.swift` contains code for launching one window in your app. This doesn’t do much on iPhone, but on iPad – where users can have multiple instances of your app open at the same time – this is important.
> - `ContentView.swift` contains the initial user interface (UI) for your program, and is where we’ll be doing all the work in this project.
> - `Preview Content` is a yellow group, with Preview Assets.xcassets inside – this is another asset catalog, this time specifically for example images you want to use when you’re designing your user interfaces, to give you an idea of how they might look when the program is running.
> - `View` comes from SwiftUI, and is the basic protocol that must be adopted by anything you want to draw on the screen – all *text*, *buttons*, *images*, and more are all views, including your own layouts that combine other views.
> - All views are now structs, whereas in UIKit they were classes
> - The View protocol has only one requirement, which is that you have a computed property called body that returns `some View`. This means it will return something that conforms to the View protocol, but that extra some keyword adds an important restriction: it must always be the same kind of view being returned – you can’t sometimes return one type of thing and other times return a different type of thing.

# Creating a form
- Forms are scrolling lists of static controls and SwiftUI has a dedicated type just for that. They can be used by wrapping views  inside a `Form` like this:

```swift
    Form {
        Text("Hello World")
    }
```
- There's an interesting limit to the maximum number of static views inside a `Form` and that's `10`. If you want to add more than `10` views then you would have to wrap them in a `Group`. This limitation actually applies everywhere in SwiftUI. There's a limit of `10` children in any parent.
- Instead of `Group` you can also use a `Section` to separate views and work around the 10 children limit.

# Adding a navigation bar
- Adding a navigation bar is pretty straight forward, you just have to wrap your views inside a `NavigationView`

```swift
    NavigationView {
        Form {
            Section {
                Text("Hello World")
            }
        }
        .navigationBarTitle("SwiftUI", displayMode: .inline)
    }
```
# Modifying program state
> - When we say SwiftUI’s views are a function of their state, we mean that the way your user interface looks – the things people can see and what they can interact with – are determined by the state of your program. For example, they can’t tap Continue until they have entered their name in a text field.

```swift
struct ContentView: View {
    @State private var tapCount = 0

    var body: some View {
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
    }
}
```

- There's normally a small issue here when trying to change the value of a property inside a struct. In order to do that we would have to type the word *mutating* but that doesn't apply to computed properties. So we have to use something new, a `PropertyWrapper` called `@State`. Then our code compiles and we can change the value of the property.

# Binding state to user interface controls
- Some controls require `two-way bindings` which means they also  need to be able to write back to the property, not just read its value. That's because it needs to make sure the right state is always saved in the property. In order to do that, we need to prefix the property with `&`. Take, for example a `TextField` control:

```swift
struct ContentView: View {
    @State private var name = ""

    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
        }
    }
}
```

# Creating views in a loop
We can use `ForEach` to create views in a loop. The ability to do that is important in many cases and it also doesn't have the `10 children` limit. For instance, we might want to create a `Picker` that displays some values using a `ForEach`. Notice also the `two-way binding` by passing `$selectedStudent` in the selection parameter of the `Picker`.

```swift
struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"

    var body: some View {
        Picker("Select your student", selection: $selectedStudent) {
            ForEach(0 ..< students.count) {
                Text(self.students[$0])
            }
        }
    }
}
```