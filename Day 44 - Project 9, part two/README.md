# Day 44 - Project 9: Drawing, Part Two
🔗 [HWS Day 44](https://www.hackingwithswift.com/100/swiftui/44)

# 📝 Notes
Covered topics:

- Transforming shapes using CGAffineTransform and even-odd fills
- Creative borders and fills using ImagePaint
- Enabling high-performance Metal rendering with drawingGroup()

# Transforming shapes using CGAffineTransform and even-odd fills

 - `CGAffineTransform` describes how a shape should be rotated, scaled or sheared.
 - We can use the even-odd rule for rendering a shape 

```swift
.fill(Color.red, style: FillStyle(eoFill: true))
```

# Creative borders and fills using ImagePaint
- Using a `Color` both as a background and as a border is because `Color` also conforms to `ShapeStyle`.
- But using an `Image` as a border won't work unless we use an `ImagePaint`. 

# Enabling high-performance Metal rendering with drawingGroup()
- `Core Animation` handles rendering pretty well without any performance issues for the most cases, but if you find yourself in a situation where the performance drops below 60 frames per second you can apply the `.drawingGroup()` modifier to switch to `Metal`.