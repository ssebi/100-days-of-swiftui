# Day 64 - Project 13, Part Three

🔗 [HWS Day 64](https://www.hackingwithswift.com/100/swiftui/64)

# 📝 Notes

Covered topics:

- Using coordinators to manage SwiftUI view controllers
- How to save images to the user’s photo library

# Using coordinators to manage SwiftUI view controllers

- The last state of the app was that we could select an image from the library, but that image wasn't shown anywhere in our UI. That's because we didn't implement the `UIImagePickerControllerDelegate` and the `UINavigationControllerDelegate`. 
- However, SwiftUI doesn't use the `delegate pattern`. Instead, it uses something called `Coordinators`.

# How to save images to the user’s photo library

- We've seen how some really old code looks like by using the `UIImageWriteToSavedPhotosAlbum` method that saves an image into the user's library. I guess that makes us at least feel grateful for the APIs that we have today 😅.