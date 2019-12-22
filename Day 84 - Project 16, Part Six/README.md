# Day 84 - Project 16, Part Six

🔗 [HWS Day 84](https://www.hackingwithswift.com/100/swiftui/84)

# 📝 Notes

Covered topics:

- Saving and loading data with UserDefaults
- Posting notifications to the lock screen

# Saving and loading data with UserDefaults

- Apart from saving data in `UserDefaults` we've also seen how we can write safer code by having Strings saved locally as static and by using encapsulation to hide implementation details and restrict data access.

# Posting notifications to the lock screen

- The last step was to add a new `Button` to the `Context menu` that lets us schedule a reminder. This time we've used the `getNotificationSettings` method to check the authorization status and only request authorization if the status is not `authorized`.