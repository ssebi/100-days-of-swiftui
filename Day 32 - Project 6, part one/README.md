# Day 32 - Project 6: Animations, Part One
🔗 [HWS Day 32](https://www.hackingwithswift.com/100/swiftui/32)

# 📝 Notes
Covered topics:

- Animation: Introduction
- Creating implicit animations
- Customizing animations in SwiftUI
- Animating bindings
- Creating explicit animations

# Animation: Introduction

- We can use animations in our app to make interfaces look better but also to give users a better understanding about what's happening.

# Creating implicit animations

- `Implicit animations` are the easiest. To create one we can use the `.animation(.default)` modifier.

```swift
@State private var animationAmount: CGFloat = 1

Button("Tap Me") {
    self.animationAmount += 1
}
.padding(50)
.background(Color.red)
.foregroundColor(.white)
.clipShape(Circle())
.scaleEffect(animationAmount)
.animation(.default)
```

# Customizing animations in SwiftUI

- Animations can be customized in various ways. The default animation is *ease in, ease out*, but we can change it to just *ease in* for example like this `.animation(.easeOut)`. 
- We could also add spring animations `.animation(.interpolatingSpring(stiffness: 50, damping: 1))`, or we can change the duration of an animation like this `.animation(.easeInOut(duration: 2))`. 
- Repeating the animation can be achieved by writing

```swit
.animation(
    Animation.easeInOut(duration: 1)
        .repeatCount(3, autoreverses: true)
)
```

# Animating bindings

- `animation()` modifier can also be applied to any SwiftUI binding, making it animate from its current value to the new value.

```swift
Stepper("Scale amount", value: $animationAmount.animation(
    Animation.easeInOut(duration: 1)
        .repeatCount(3, autoreverses: true)
), in: 1...10)
```

- We can also use non-view code in the `body` property, but then we have to make sure we return some view code

```swift
var body: some View {
    print(animationAmount)

    return VStack {
```

# Creating explicit animations

- There's also `explicit animations` that we can trigger using the `withAnimation` block:

```swift
withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
    self.animationAmount += 360
}
```

- This way we don't have to add the `animation()` modifier to the view, neither to a binding.