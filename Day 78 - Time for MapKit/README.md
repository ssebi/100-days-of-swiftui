# Day 78 - Time for MapKit

🔗 [HWS Day 78](https://www.hackingwithswift.com/100/swiftui/78)

# 📝 Notes

Covered topics:

- Additional challenge

# 🎯 Additional challenge

>
Yesterday you built a new app that imports photos from the user’s library, and hopefully you’re pleased with the finished product – or at least making great progress towards the finished product.

>
But your boss has come in and demanded a new feature: when you’re viewing a picture that was imported, you should show a map with a pin on that marked where they were when that pin was added. It might be on the same screen side by side with the photo, it might be shown or hidden using a segmented control, or perhaps it’s on a different screen – it’s down to you. Regardless, you know how to drop pins, and you also know how to use the center coordinate of map views, so the only thing left to figure out is how to get the user’s location to save alongside their text and image.

>
Although I do want you to push your skills, I’m not cruel. So, here’s a class that fetches the user’s location:

```swift
import CoreLocation

class LocationFetcher: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var lastKnownLocation: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
    }

    func start() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.first?.coordinate
    }
}
```
>
To use that, start by adding a new key to Info.plist called “Privacy - Location When In Use Usage Description”, then give it some sort of value explaining to the user why you need their location.

>
Now you can use it inside SwiftUI view like this:

```swift
struct ContentView: View {
    let locationFetcher = LocationFetcher()

    var body: some View {
        VStack {
            Button("Start Tracking Location") {
                self.locationFetcher.start()
            }

            Button("Read Location") {
                if let location = self.locationFetcher.lastKnownLocation {
                    print("Your location is \(location)")
                } else {
                    print("Your location is unknown")
                }
            }
        }
    }
}
```
>
If you’re using the simulator rather than a real device, you can fake a location by going to the Debug menu and choosing Location > Apple.

>
And now it’s over to you: can you add the feature your boss wants, and bring MapKit, UIKit, and SwiftUI together in a single app?

>
Tip: If you want to make your app really useful, try setting the sourceType property of your image picker controller to .camera so that it lets user take new photos rather than import existing ones.