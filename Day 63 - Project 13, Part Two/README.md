# Day 63 - Project 13, Part Two

🔗 [HWS Day 63](https://www.hackingwithswift.com/100/swiftui/63)

# 📝 Notes

Covered topics:

- Integrating Core Image with SwiftUI
- Wrapping a UIViewController in a SwiftUI view

# Integrating Core Image with SwiftUI

`CoreImage` is Apple's framework that enables us to apply filters and modify images.

So far, we've only used one type of image, which is `Image` but there are three other types: `UIImage` (coming from UIKit), `CGImage` (Core Graphics) and `CIImage` (Core Image).

>
There is some interoperability between the various image types:
>
- We can create a `UIImage` from a `CGImage`, and create a `CGImage` from a `UIImage`.
- We can create a `CIImage` from a `UIImage` and from a `CGImage`, and can create a `CGImage` from a `CIImage`.
- We can create a SwiftUI `Image` from both a `UIImage` and a `CGImage`.

This is the necessary code for applying a filter using `CoreImage`:

```swift
func loadImage() {
    guard let inputImage = UIImage(named: "Example") else { return }

    let beginImage = CIImage(image: inputImage)

    let context = CIContext()
    let currentFilter = CIFilter.crystallize()
    currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
    currentFilter.radius = 50

    // get a CIImage from our filter or exit if that fails
    guard let outputImage = currentFilter.outputImage else { return }

    // attempt to get a CGImage from our CIImage
    if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
        // convert that to a UIImage
        let uiImage = UIImage(cgImage: cgimg)

        // and convert that to a SwiftUI image
        image = Image(uiImage: uiImage)
    }
}
```

- Note that we're using an older API which is *stringly typed* because the newer API sometimes crashes in SwiftUI.

# Wrapping a UIViewController in a SwiftUI view

- Because SwiftUI currently has some limitations, we sometimes need to fallback to the UIKit in some situations. To do that we need to conform to the `UIViewControllerRepresentable` protocol. Then the struct that conforms to this protocol can directly be used inside SwiftUI's view hierarchy.

- UIKit has some special classes to load an image from the user's library: `UIImagePickerController`, and delegate protocols called `UINavigationControllerDelegate` and `UIImagePickerControllerDelegate`.