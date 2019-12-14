# Day 69 - Bucket List, Part Two

🔗 [HWS Day 69](https://www.hackingwithswift.com/100/swiftui/69)

# 📝 Notes

Covered topics:

- Integrating MapKit with SwiftUI
- Communicating with a MapKit coordinator
- Using Touch ID and Face ID with SwiftUI


# Integrating MapKit with SwiftUI

- Now we get to work with another component that has to be ported to `SwiftUI`, `MKMapView`. As the name implies, this is not a `ViewController` as in the previous project, this is a `View`, which means we'll need to use another protocol called `UIViewRepresentable`. Previously we've used the `UIViewControllerRepresentable` because we wanted to bring a `UIViewController` type to `SwiftUI`.
- There's a nice `typealias` in this protocol:

```swift
typealias Context = UIViewRepresentableContext<Self>
```

which means that we can just write `Context` instead of `UIViewRepresentableContext<MapView>`.

# Communicating with a MapKit coordinator

- In this part, we've practiced `Coordinators` again and we've also worked a little bit more with `MapKit`, adding custom annotations and pins.

# Using Touch ID and Face ID with SwiftUI

- Now we've also seen how easy it is to use TouchID and FaceID for authentication in `SwiftUI`. The only downside is that this is an old Objective C framework and we have to use `NSError` to see the authentication errors which has to be passed with an `&` as an `inout` parameter (not as a two-way binding 😁).