# Day 83 - Project 16, Part Five

🔗 [HWS Day 83](https://www.hackingwithswift.com/100/swiftui/83)

# 📝 Notes

Covered topics:

- Generating and scaling up a QR code
- Scanning QR codes with SwiftUI
- Adding options with a context menu

# Generating and scaling up a QR code

- Now we've changed our focus on the last tab bar view, the `MeView`. What we did here is we've added two text fields where users can type their name and e-mail and we dynamically generate a QR code based on that. We can generate a QR code using the `CIFilterBuiltins` of `CoreImage`:

```swift
let context = CIContext()
let filter = CIFilter.qrCodeGenerator()

func generateQRCode(from string: String) -> UIImage {
    let data = Data(string.utf8)
    filter.setValue(data, forKey: "inputMessage")

    if let outputImage = filter.outputImage {
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgimg)
        }
    }

    return UIImage(systemName: "xmark.circle") ?? UIImage()
}
```

# Scanning QR codes with SwiftUI

- In this part we've added an external dependency that handles QR Code scanning and returns a `Result` type which is either the scanned String or an Error in case that the QR couldn't be read.

# Adding options with a context menu

- Now we've added a context menu to mark the prospect as contacted or uncontacted. Because this modifies a property from the Prospect class, the UI doesn't get updated. To fix this we've added a function that marks the prospect but it also updates the UI manually before that. One extra step was to mark the `isContacted` property as `fileprivate(set)` so it can only be modified inside the file it has been declared. This way another developer will  be forced to use the function that also updates the UI when changing the `isContacted` Bool leaving no place for bugs. The property can still be read from anywhere.