Day 58 - Core Data, Part Two

🔗 [HWS Day 58](https://www.hackingwithswift.com/100/swiftui/58)


# 📝 Notes

Covered topics:

- Filtering @FetchRequest using NSPredicate
- Dynamically filtering @FetchRequest with SwiftUI
- One-to-many relationships with Core Data, SwiftUI, and @FetchRequest

# Filtering @FetchRequest using NSPredicate

- When fetching data using the `@FetchRequest` you can filter that data by passing an `NSPredicate` into the predicate parameter:

- This will return all objects where *universe* equals *Star Wars*:

```swift
NSPredicate(format: "universe == %@", "Star Wars")
```

- This one returns the objects that have names starting with a letter smaller than `F`:

```swift
NSPredicate(format: "name < %@", "F")
```

- To check whether a value is between a range of values we could use this:

```swift
NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])
```

- This is how you get all objects that begin with a specific letter:

```swift
NSPredicate(format: "name BEGINSWITH %@", "E"))
```

- However, `beginswith` is case sensitive. To get rid of that you can put a `[c]` after:

```swift
NSPredicate(format: "name BEGINSWITH[c] %@", "e"))
```

- Or you could also inverse the regular behavior with `NOT`:

```swift
NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e"))
```

- `NSPredicates` can also be joined together with `AND`. Or you could also use the `NSCompoundPredicate`

# Dynamically filtering @FetchRequest with SwiftUI

- We've seen here a very useful example of how we can dynamically change the filtering in an `@FetchRequest`. To do that we need to extract our functionality in another `View` and give it the needed parameters.
- To modify the `key` of the `NSPredicate` you can use `%K`:

```swift
NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue)
```


# One-to-many relationships with Core Data, SwiftUI, and @FetchRequest

- So far we didn't have to do any extra work to make `CoreData` work with SwiftUI but in this part of the project, we've seen a certain aspect where we need to. That's the one-to-many relationships because they use the old `NSSet` which is pretty easy to fix:

```swift
public var candyArray: [Candy] {
    let set = candy as? Set<Candy> ?? []
    return set.sorted {
        $0.wrappedName < $1.wrappedName
    }
}
```

- Now, in our SwiftUI code we can simply use the candyArray computed property.