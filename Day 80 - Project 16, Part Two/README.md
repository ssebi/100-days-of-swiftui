# Day 80 - Project 16, Part Two

🔗 [HWS Day 80](https://www.hackingwithswift.com/100/swiftui/80)

# 📝 Notes

Covered topics:

- Understanding Swift’s Result type
- Manually publishing ObservableObject changes
- Controlling image interpolation in SwiftUI

# Understanding Swift’s Result type

- We've seen how useful Swift's `Result` type can be in situations where only one case can be true, never both. That's especially helpful when writing networking code to represent the result of a url request because that can either be successful or it can fail. 
- For success cases we pass the data using `.success()` and for failure we use `.failure()`.

# Manually publishing ObservableObject changes

- If we need more control, we can manually publish the changes of an `ObservableObject` by calling `send()` on the `objectWillChange`, inside the `willSet` observer. We no longer have to rely on the `@Published` property wrapper now.

```swift
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
```

# Controlling image interpolation in SwiftUI

- When an `Image` view has a size which is bigger than the image it holds, that image is being stretched and in technical terms that's called *image interpolation*. If the image is very small and we try to fit it on the whole screen we'll see jagged and blurred edges. The blur is done by `SwiftUI` in order to make it less obvious that the image is stretched. But if we want to prevent that, we can change that by using the `.interpolation(.none)` modifier.