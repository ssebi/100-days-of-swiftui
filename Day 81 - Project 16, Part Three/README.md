# Day 81 - Project 16, Part Three

🔗 [HWS Day 81](https://www.hackingwithswift.com/100/swiftui/81)

# 📝 Notes

Covered topics:

- Creating context menus
- Scheduling local notifications
- Adding Swift package dependencies in Xcode

# Creating context menus

- To add `Context menus` to your app, you have to use the `.contextMenu` modifier and design its context in the completion block.
- Something to be careful at, is that images inside the context menus are rendered as solid colors with preserved opacity

>
For best experience, you should:
>
- If you’re going to use them, use them in lots of places – it can be frustrating to press and hold on something only to find nothing happens.
- Keep your list of options as short as you can – aim for three or less.
- Don’t repeat options the user can already see elsewhere in your UI.

# Scheduling local notifications

- Using Apple's `UserNotifications` framework we're able to create notifications that users can see on the lock screen. There are Local Notifications and Remote Notifications (often referred to as Push Notifications). Push Notifications are harder to do because they require a server that sends the notifications to Apple's Push Notifications Service (APNS) and then get sent to users. Local Notifications are a lot easier:

```swift
VStack {
	Button("Request Permission") {
		UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
		    if success {
		        print("All set!")
		    } else if let error = error {
		        print(error.localizedDescription)
		    }
		}
	}
	
	Button("Schedule Notification") {
		let content = UNMutableNotificationContent()
		content.title = "Feed the cat"
		content.subtitle = "It looks hungry"
		content.sound = UNNotificationSound.default
	
		// show this notification five seconds from now
		let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
	
		// choose a random identifier
		let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
	
		// add our notification request
		UNUserNotificationCenter.current().add(request)
	}
}
```

# Adding Swift package dependencies in Xcode

- To add external external dependencies into your project, Xcode provides a dependency management tool called SPM (Swift Package Manager). 
- In order to add a dependency using SPM, you have to go to `File menu, Swift Packages > Add Package Dependency`. Then you have to add the URL to the repository of the external dependency and specify the desired Version. Default is the `Up to Next Major` option which should ensure there will be no breaking changes. That's because developers use what's called `SemVer` (semantic versioning). If you want to follow that too, you have to follow these rules:

>
- Change the patch number when fixing a bug as long as it doesn’t break any APIs or adds features.
- Change the minor number when they added features that don’t break any APIs.
- Change the major number when they do break APIs.