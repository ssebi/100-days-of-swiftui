Day 57 - Core Data, Part One

🔗 [HWS Day 57](https://www.hackingwithswift.com/100/swiftui/57)


# 📝 Notes

Covered topics:

- Core Data: Introduction
- Why does \.self work for ForEach?
- Creating NSManagedObject subclasses
- Conditional saving of NSManagedObjectContext
- Ensuring Core Data objects are unique using constraints

# Core Data: Introduction

- In this project we're going to dive deeper into `CoreData`.

# Why does \.self work for ForEach?

- The reason we can use `\.self` in a `ForEach` to uniquely identify the items is because those items conform to the `Hashable` protocol. `String` and `Int` both conform to `Hashable` and that's why you can use `\.self` with them.
- For objects created by `Core Data`, there's also an additional property, an object ID which is unique.

# Creating NSManagedObject subclasses

- So far, we used the classes automatically generated by Xcode to fetch out entities but we can also create our own subclasses.
- In these subclasses we might be tempted to remove to optional `?` sign after the properties but we might want to think twice before doing that. That is because `CoreData` uses something called `faulting` and we interfere with that mechanism by modifying the properties. What we can safety do is add computed properties.

# Conditional saving of NSManagedObjectContext

- Whenever we want to call the `save()` function on the `NSManagedObjectContext` we should also check for changes to avoid unnecessary work:

```swift
if self.moc.hasChanges {
    try? self.moc.save()
}
```

# Ensuring Core Data objects are unique using constraints

- We can add some constraints if we want to ensure some objects are unique but we will get an error when a duplicate is being saved. To fix that we can instruct `Core Data` what to do in such cases:

```swift
context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
```
