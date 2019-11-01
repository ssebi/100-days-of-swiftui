# Day 23 – Project 3: Guess the Flag, Part One
🔗 [HWS Day 23](https://www.hackingwithswift.com/100/swiftui/23)

# 📝 Notes
Covered topics:

- Views and modifiers: Introduction
- Why does SwiftUI use structs for views?
- What is behind the main SwiftUI view?
- Why modifier order matters
- Why does SwiftUI use “some View” for its view type?
- Conditional modifiers
- Environment modifiers
- Views as properties
- View composition
- Custom modifiers
- Custom containers

# Views and modifiers: Introduction
- This is more of a technical project which goes a little more in depth and explain some of the magic behind SwiftUI. We're going to see why we use `some View`, why does SwiftUI use `structs` instead of `classes` and how do `modifiers` work.

# Why does SwiftUI use structs for views?
There are a couple of reasons why SwiftUI uses structs instead of views. Some of those reasons are these:
- structs are more lightweight and they don't support inheritance, meaning that when creating a View you won't be carrying around about 200 properties and methods that a `UIView` has even if you don't use any of them.
- structs forces us to isolate state in a clean way because they can't be mutated over time resulting in unexpected behaviour. This way, the views that we create simply convert data into UI.

# What is behind the main SwiftUI view?
- `UIHostingController` is the bridge between UIKit and SwiftUI.
- We need to change our mindsets (if coming from UIKit) so that if we see code like this

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .background(Color.red)
    }
}
```
- it actually means there's only one view, and that's the `Text`. So the red background will only apply to it. There's no way we can set the background behind to be red, be cause there's nothing behind. Instead, we can increase the frame of the `Text` to take up the full screen

# Why modifier order matters
This might come as a surprise, but the order in which you apply the modifier matters. Consider this example: 

```swift
Button("Hello World") {
    // do nothing
}    
.background(Color.red)
.frame(width: 200, height: 200)
```

This actually shows the red color just behind the text. But if we change the order of the modifiers, then we get a 200 by 200 red button.

- That's because the original view is not being modified. A new view is actually returned, with the modifier applied.
- SwiftUI does that by using generics that look like `ModifiedContent<OurThing, OurModifier>`. After each modifier applied they just stack up like this `ModifiedContent<ModifiedContent<…`.

# Why does SwiftUI use “some View” for its view type?

- SwiftUI uses a new feature introduced in Swift 5.1 called `opaque return types` which means that we must always return the same type of view and that type is known at compile time. It's a good analogy to think of them as of an array, where we must specify the type it contains. The same way we must specify the type of the view.
- Stacks conform to the `View` protocol but the way they actually tell what type of elements it contains is by creating  a `TupleView` which holds the view types. And that's also the reason why SwiftUI has the 10 children limit, because there are versions of `TupleViews` specially written to handle from two to ten views inside, like so `TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)>`. But they had to stop somewhere, they couldn't have kept on writing versions of the `TupleView` for every number.

# Conditional modifiers

- In order to apply modifiers only if some conditions is met, we can use the ternary operator like in the following example:

```swift
struct ContentView: View {
    @State private var useRedText = false

    var body: some View {
        Button("Hello World") {
            // flip the Boolean between true and false
            self.useRedText.toggle()            
        }
        .foregroundColor(useRedText ? .red : .blue)
    }
}
```

# Environment modifiers

```swift
VStack {
    Text("Gryffindor")
    Text("Hufflepuff")
    Text("Ravenclaw")
    Text("Slytherin")
}
.font(.title)
```

- `.font(.title)` modifier in this example is called an `environment modifier` because it applies to all the views inside the `VStack`. 
- But if we apply a `regular modifier` to one of the children, it will take priority.
- However, there are some modifiers that are just `regular modifiers`, like `blur()` for example. Those cannot be overridden.

# Views as properties

- To make it easier to write complex UI, one of the techniques that we can use is to write `views as properties`.

```swift
struct ContentView: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")

    var body: some View {
        VStack {
            motto1
	            .foregroundColor(.red)
            motto2
	            .foregroundColor(.blue)
        }
    }
}
```

- Or we can write them as computed properties:

```swift
var motto1: some View { Text("Draco dormiens") }
```

# View composition

- One other thing that we can use to deal with complex UI hierarchies is to refactor structures into separate views. This is how a component might look like:

```swift
struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}
```

- Then we can use the component like this:

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
            CapsuleText(text: "Second")
        }
    }
}
```

# Custom modifiers

- When the built-in modifiers are not enough, we can also build our own custom modifiers. This is extremely useful when we have a couple of modifiers giving a certain result which we use more than a couple of times in our view code. The following code creates a custom `Title` modifier which we can then apply to our views.

```swift
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}
```
 - We can apply the modifier like this:

```swift
Text("Hello World")
    .titleStyle()
```

# Custom containers

- One power feature of SwiftUI is the ability to create custom containers, like this `GridStack` that allows us to store views in a grid

```swift
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
	    VStack {
	        ForEach(0 ..< rows) { row in
	            HStack {
	                ForEach(0 ..< self.columns) { column in
	                    self.content(row, column)
	                }
	            }
	        }
			 }
    }
}
```

- Then we can use the custom container like so:

```swift
struct ContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Text("R\(row) C\(col)")
        }
    }
}
```