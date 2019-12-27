# Day 92 - Project 18, Part One

🔗 [HWS Day 92](https://www.hackingwithswift.com/100/swiftui/92)


# 📝 Notes

Covered topics:

- Layout and geometry: Introduction
- How layout works in SwiftUI
- Alignment and alignment guides
- How to create a custom alignment guide

# Layout and geometry: Introduction

>
In this technique project we’re going to explore how SwiftUI handles layout. Some of these things have been explained a little already, some of them you might have figured out yourself, but many more are things you might just have taken for granted to this point, so I hope a detailed exploration will really shed some light on how SwiftUI works.

# How layout works in SwiftUI

- We've gained deeper insights on how the layout system works in SwiftUI. In the case of two views, as it is the default example when we create a new SwiftUI file it works like this: first the parent view asks its child how much space they need, then the child chooses their size (which the parent must respect) and finally the parent centers the child. When more views are involved the same logic applies.
- Modifiers add an interesting twist since they add a new view with the specified modifications. It's a good idea to mentally picture them as separate views because they become children views and they'll also be asked about how much space they need. That's why the order of the modifiers matters.
- Some views can be *layout neutral* which means that they don't have a fixed size and they adjusts to fit whatever size it's needed.

# Alignment and alignment guides

- One alignment option is to use `frame`'s  `alignment` parameter: 

```swift
.frame(width: 300, height: 300, alignment: .topLeading)
```

- One other option for aligning content in SwiftUI is to use Stack's alignment parameter:

```swift
HStack(alignment: .bottom)
```

- One cool alignment option for text is the `.lastTextBaseline`
- If you need more fine-grained control over the alignment of individual views you can also use the following modifier:

```swift
.alignmentGuide(.leading) { d in d[.leading] }
```

- You can also have custom calculations inside the `.alignmentGuide`'s completion.

# How to create a custom alignment guide

- If you need to align views from different stacks none of the existing alignment guides will be helpful. We can create our own custom alignment guides to fix that:

```swift
extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}
```

- Using it afterwards is as simple as this:

```swift
HStack(alignment: .midAccountAndName)
```

```swift
Text("@twostraws")
	.alignmentGuide(.midAccountAndName) { d in 
		d[VerticalAlignment.center] 
	}
```