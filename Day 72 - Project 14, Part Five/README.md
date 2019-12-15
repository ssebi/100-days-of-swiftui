# Day 72 - Bucket List, Part Five

🔗 [HWS Day 72](https://www.hackingwithswift.com/100/swiftui/72)

# 📝 Notes

Covered topics:

- Making someone else’s class conform to Codable
- Locking our UI behind Face ID

# Making someone else’s class conform to Codable

- If we try to conform `MKPointAnnotation` to `Codable` that code won't compile because the class can be subclassed and we can't guarantee that every subclass can conform to `Codable`. To solve these issues we can do a couple of things: create a subclass of `MKPointAnnotation` and conform that to `Codable`;  Create a new class that implements the `MKAnnotation` protocol; Write a wrapper class that internally stores a `MKPointAnnotation`.
- We can write encrypted data by adding an additional property to the options parameter of the `write` function. This will make sure that the file can't be read if the device is locked.

# Locking our UI behind Face ID

- In the last step we've also added the FaceID unlock to the project. Now only authorized persons will be able to see the saved locations. The code for the unlock we've already seen in the previous parts.