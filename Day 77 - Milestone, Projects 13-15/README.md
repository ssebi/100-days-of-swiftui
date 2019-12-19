# Day 77 - Milestone: Projects 13-15

🔗 [HWS Day 77](https://www.hackingwithswift.com/100/swiftui/77)

# 📝 Notes

Covered topics:

- What you learned
- Key points
- Challenge

# What you learned

>
- How property wrappers become structs
- Creating custom bindings
- Presenting action sheets with lots of buttons
- Using Core Image to manipulate images
- Integrating UIImagePickerController into SwiftUI
- Integrating MKMapView into SwiftUI
- Writing coordinator classes that can act as delegates for image pickers and map views
- Dropping pins on maps
- Saving images to the user’s photo library
- Adding Comparable conformance to custom types
- Finding and writing to the user’s documents directory
- Enabling file encryption when writing
- Authenticating users with Touch ID and Face ID

# Key points

- `Operator overloading` can be both a blessing and a curse because sometimes it might not provide as much clarity. On the plus side, it can be used to create some handy extensions such as this one:

```swift
extension BinaryInteger {
    static func * (lhs: Self, rhs: CGFloat) -> CGFloat {
        return CGFloat(lhs) * rhs
    }

    static func * (lhs: Self, rhs: Self) -> CGFloat {
        return lhs * CGFloat(rhs)
    }

    static func * (lhs: Self, rhs: Double) -> Double {
        return Double(lhs) * rhs
    }

    static func * (lhs: Double, rhs: Self) -> Double {
        return lhs * Double(rhs)
    }
}
```

This way, we won't need to write the annoying type casting every-time we multiply an `Int` with a `Double`.

- `Custom Property Wrappers` can be written to add extra functionality to a property. For example, you can write a property wrapper that doesn't let an `Int` be negative:

```swift
@propertyWrapper
struct NonNegative<Value: BinaryInteger> {
    var value: Value

    init(wrappedValue: Value) {
        if wrappedValue < 0 {
            self.value = 0
        } else {
            self.value = wrappedValue
        }
    }

    var wrappedValue: Value {
        get { value }
        set {
            if newValue < 0 {
                value = 0
            } else {
                value = newValue
            }
        }
    }
}
```

- More on this here [https://www.hackingwithswift.com/guide/ios-swiftui/6/2/key-points](https://www.hackingwithswift.com/guide/ios-swiftui/6/2/key-points)

# Challenge

>
Your goal is to build an app that asks users to import a picture from their photo library, then attach a name to whatever they imported. The full collection of pictures they name should be shown in a List, and tapping an item in the list should show a detail screen with a larger version of the picture.
>
Breaking it down, you should:
>
Wrap UIImagePickerController so it can be used to select photos.
Detect when a new photo is imported, and immediately ask the user to name the photo.
Save that name and photo somewhere safe.
Show all names and photos in a list, sorted by name.
Create a detail screen that shows a picture full size.
Decide on a way to save all this data.
We’ve covered how to save data to the user’s photo library using UIImageWriteToSavedPhotosAlbum(), but saving an image to disk requires a small extra step: you need to convert your UIImage to Data by calling its jpegData() method like this:
>
```swift
if let jpegData = yourUIImage.jpegData(compressionQuality: 0.8) {
    try? jpegData.write(to: yourURL, options: [.atomicWrite, .completeFileProtection])
}
```
The compressionQuality parameter can be any value between 0 (very low quality) and 1 (maximum quality); something like 0.8 gives a good trade off between size and quality.
>
You can use Core Data for this project if you want to, but it isn’t required – a simple JSON file written out to the documents directory is fine, although you will need to add a custom conformance to Comparable to get array sorting to work.
>
If you do choose to use Core Data, make sure you don’t save the actual image into the database because that’s not efficient. Core Data or not, the optimal thing to do is generate a new UUID for the image filename then write it to the documents directory, and store that UUID in your data model.