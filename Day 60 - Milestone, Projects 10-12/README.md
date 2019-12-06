Day 60 - Milestone: Projects 10-12

🔗 [HWS Day 60](https://www.hackingwithswift.com/100/swiftui/60)


# 📝 Notes

Covered topics:

- What you learned
- Key points
- Challenge

# What you learned

>
- Building custom `Codable` conformance
- Sending and receiving data using `URLSession`
- The `disabled()` modifier for views
- Building custom UI components using `@Bindable`
- Using `AnyView` for type erasure
- Adding multiple buttons to an alert
- How Swift’s `Hashable` protocol is used in SwiftUI
- Using the `@FetchRequest` property wrapper to query Core Data
- Sorting Core Data results using `NSSortDescriptor`
- Creating custom `NSManagedObject` subclasses
- Filtering data using `NSPredicate`
- Creating relationships between Core Data entities

# Key points

We've focused on two topics, `Type Erasure` and `Codable`.

## Type Erasure

You might have used a `Group` for the same reason: to go around the `some View` opaque return type restrictions and you might have wondered how is that different than `AnyView`. `Group` might provide better performance but it shouldn't be obvious in most cases. However using `AnyView` offers more expressivity, so if someone sees it the intent is more clear.

When using type erasure extensively you can use this handy extension:

```swift
extension View {
    func erasedToAnyView() -> AnyView {
        AnyView(self)
    }
}
```

## Codable

We can use the `keyDecodingStrategy` to deal with JSONs that have keys like this `first_name` (snake case).

```swift
let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase
```

Using `CodingKeys` enum might be enough in some cases and we don't have to create custom `Codable` conformance.

Example:

```swift
enum CodingKeys: String, CodingKey {
    case firstName = "first"
    case lastName = "last"
}
```

# 🎯 Challenge

📐 Work in Progress

> It’s time for you to build an app from scratch, and it’s a particularly expansive challenge today: your job is to use URLSession to download some JSON from the internet, use Codable to convert it to Swift types, then use NavigationView, List, and more to display it to the user.
> 
> Your first step should be to examine the JSON. The URL you want to use is this: [https://www.hackingwithswift.com/samples/friendface.json](https://www.hackingwithswift.com/samples/friendface.json) – that’s a massive collection of randomly generated data for example users.
> 
> As you can see, there is an array of people, and each person has an ID, name, age, email address, and more. They also have an array of tag strings, and an array of friends, where each friend has a name and ID.
> 
> How far you implement this is down to you, but at the very least you should:
> 
> Fetch the data and parse it into User and Friend structs.
> Display a list of users with a little information about them.
> Create a detail view shown when a user is tapped, presenting more information about them.
> Where things get more interesting is with their friends: if you really want to push your skills, think about how to show each user’s friends on the detail screen.
> 
> For a medium-sized challenge, show a little information about their friends right on the detail screen. For a bigger challenge, make each of those friends tappable to show their own detail view.
> 
> Even though there’s a lot of data, we’re only working with 100 friends at a time – using something like first(where:) to find friends in the array is perfectly fine.
> 
> If you’re not sure where to begin, start by designing your types: build a User struct with properties for name, age, company, and so on, then a Friend struct with id and name. After that, move onto some URLSession code to fetch the data and decode it into your types.