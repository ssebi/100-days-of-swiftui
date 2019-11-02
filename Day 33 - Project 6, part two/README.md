# Day 33 - Project 6: Animations, Part Two
🔗 [HWS Day 33](https://www.hackingwithswift.com/100/swiftui/33)

# 📝 Notes
Covered topics:

- Controlling the animation stack
- Animating gestures
- Showing and hiding views with transitions
- Building custom transitions using ViewModifier

# Controlling the animation stack

- Just as the order in which we apply modifiers matters, also the order in which we apply animations matter. So if we apply the `animation()` modifier everything that's above it will get animated but whatever modifiers are coming below it will not be animated.
- What's even more crazy is that we can apply multiple animations and each one will control everything before it.

```swift
Button("Tap Me") {
    self.enabled.toggle()
}
.frame(width: 200, height: 200)
.background(enabled ? Color.blue : Color.red)
.animation(.default)
.foregroundColor(.white)
.clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
.animation(.interpolatingSpring(stiffness: 10, damping: 1))
```

- The animation can also be disabled by passing `nil` as the argument `.animation(nil)`.

# Animating gestures

- We can drag a view on the screen. First we need a @State property:

```swift
@State private var dragAmount = CGSize.zero
```

- Second we need to apply an offset modifier:

```swift
.offset(dragAmount)
```

- Third, we need to add a `DragGesture()`:

```swift
.gesture(
    DragGesture()
        .onChanged { self.dragAmount = $0.translation }
        .onEnded { _ in self.dragAmount = .zero }
)
```

# Showing and hiding views with transitions

- We can use the `transition` modifier to animate the way views behave when they are shown or hidden

```swift
.transition(.asymmetric(insertion: .scale, removal: .opacity))
```

# Building custom transitions using ViewModifier

- We can also create our own custom transitions thanks to the `transition` modifier that accepts any view modifier.
- Note that some of the transitions don't look quite well in the Preview, so you might need to run the app in the simulator.