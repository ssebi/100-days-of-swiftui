# Day 65 - Project 13, Part Four

🔗 [HWS Day 65](https://www.hackingwithswift.com/100/swiftui/65)

# 📝 Notes

Covered topics:

- Building our basic UI
- Importing an image into SwiftUI using UIImagePickerController
- Basic image filtering using Core Image

# Building our basic UI

- Very interesting is that only a limited amount of logic can be put into SwiftUI's body property. That's because a simple `if` statement is internally converted into a type called `ConditionalContent`. However, `loops`, `switch` and `if let` cannot be used.

# Importing an image into SwiftUI using UIImagePickerController

- Here we're implementing the `UIImagePickerController` practicing some more with integrating `UIKit` into `SwiftUI`

# Basic image filtering using Core Image

- Now we finally get to use `CoreImage`. We also practice `Custom Bindings` to apply the processing every time the slider value changes.