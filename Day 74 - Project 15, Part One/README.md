# Day 74 - Accessibility, Part One

🔗 [HWS Day 74](https://www.hackingwithswift.com/100/swiftui/74)

# 📝 Notes

Covered topics:

- Accessibility: Introduction
- Identifying views with useful labels
- Hiding and grouping accessibility data
- Reading the value of controls

# Accessibility: Introduction

>
Making your app accessible means taking steps to ensure that everyone can use it fully regardless of their individual needs. For example, if they are blind then your app should work well with the system’s VoiceOver system to ensure your UI can be read smoothly.

# Identifying views with useful labels

- `VoiceOver` can be controller by the following modifiers: `.accessibility(label:)` and `.accessibility(hint:)`. The first one is usually used as a short description of the view, so that the person using `VoiceOver` understands what the view does and the second one can be a longer text that gives more details. It will be read after a short delay.
- We can also add or remove traits using the `.accessibility(addTraits:)` and the `.accessibility(removeTraits:)` modifiers. They let us provide extra info to the `VoiceOver`.

# Hiding and grouping accessibility data

- It's important that we remove any clutter in our UI by grouping views or by hiding views that are not important and should not be read by the `VoiceOver`.
- If we use the `Image(decorative:)` initializer, the `Image` won't be read by the `VoiceOver`, unless it has important traits such as `.isButton`	 or a `TapGesture` attached.
- You can also hide views completely by using the `.accessibility(hidden:)` modifier.
- To group views together you can apply the `.accessibilityElement(children: .combine)` modifier. That reads the views with a pause but in some cases it would sound more natural when using a combination of two modifiers like this:

```swift
VStack {
    Text("Your score is")
    Text("1000")
        .font(.title)
}
.accessibilityElement(children: .ignore)
.accessibility(label: Text("Your score is 1000"))
```

# Reading the value of controls

- When reading the value of controls, there might be cases where the default is not what you want and for that reason you can use the `.accessibility(value:)` modifier to provide custom text.