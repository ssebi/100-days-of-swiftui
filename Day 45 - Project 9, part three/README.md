# Day 45 - Project 9: Drawing, Part Three
🔗 [HWS Day 45](https://www.hackingwithswift.com/100/swiftui/45)

# 📝 Notes
Covered topics:

- Special effects in SwiftUI: blurs, blending, and more
- Animating simple shapes with animatableData
- Animating complex shapes with AnimatablePair

For brave people:
- Creating a spirograph with SwiftUI

# Special effects in SwiftUI: blurs, blending, and more

 - We have the ability to control blur, blending, saturation and more in SwiftUI.
 - The `multiply` blending mode is so common that SwiftUI provides a designated modifier for it `.colorMultiply(.red)`.
 - When we use `Color.red` or `Color.green` we're not seeing pure colors, we actually see adaptive colors specially designed to look good in both light and dark modes.

# Animating simple shapes with animatableData

 - To animate `Shapes`, we need to add the `animatableData` computed property otherwise we won't see the animation happening. Internally, this is done by providing all the intermediate values between the original amount and the final  amount.

# Animating complex shapes with AnimatablePair

- We can quickly see there is a problem with the `animatableData`, it only works with one property. But there might be times when we want to animate multiple properties and  that when we use the `AnimatablePair`.

```swift
    public var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }

        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
    }
```

- This is how the `animatableData` property of `EdgeInsets` looks like, and that's because it has to go even further than two properties:

```swift
AnimatablePair<CGFloat, AnimatablePair<CGFloat, AnimatablePair<CGFloat, CGFloat>>>
```

# Creating a spirograph with SwiftUI

>
To finish off with something that really goes to town with drawing, I’m going to walk you through creating a simple spirograph with SwiftUI. “Spirograph” is the trademarked name for a toy where you place a pencil inside a circle and spin it around the circumference of another circle, creating various geometric patterns that are known as roulettes – like the casino game.