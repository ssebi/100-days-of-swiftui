 Day 53 - Bookworm, Part One

🔗 [HWS Day 53](https://www.hackingwithswift.com/100/swiftui/53)

🔗 [Resources] (https://github.com/twostraws/HackingWithSwift)


# 📝 Notes

Covered topics:

- Bookworm: Introduction
- Creating a custom component with @Binding
- Using size classes with AnyView type erasure
- How to combine Core Data and SwiftUI

# Bookworm: Introduction

>
In this project we’re going to build an app to track which books you’ve read and what you thought of them, and it’s going to follow a similar theme to project 10: let’s take all the skills you’ve already mastered, then add some bonus new skills that take them all to a new level.

# Creating a custom component with @Binding

- If you've ever wondered what's up with the `Binding<Bool>` in a `Toggle` for example, or with the `Binding<Strideable>` in the `Stepper` good news, now we learn about it. What `@Binding` Property Wrapper enables us to do is interact with properties of other Views from within our own View. That's how an `.alert` can change set our `@State` boolean property to `false` when it's dismissed.

# Using size classes with AnyView type erasure

- We can get some information about how much space our app has on the screen from the `SizeClasses`, which can be accessed from the `@Environment`:

```swift
@Environment(\.horizontalSizeClass) var sizeClass
```

- So far, we've learnt that we can't return two different types of `Views` from the `body` property because of the `some View` opaque return type. However, there is a way to go around that and that's called `type erasure` and we can return `AnyView`:

```swift
var body: some View {
    if sizeClass == .compact {
        return AnyView(VStack {
            Text("Active size class:")
            Text("COMPACT")
        }
        .font(.largeTitle))
    } else {
        return AnyView(HStack {
            Text("Active size class:")
            Text("REGULAR")
        }
        .font(.largeTitle))
    }
}
```

- However, we shouldn't overuse this technique because then SwiftUI won't be able to do some performance optimizations.

# How to combine Core Data and SwiftUI

- `CoreData` is used to persist data in a database. It's a real workhorse helping with things such as saving data, validation, lazy loading, undo, redo and others. Even though `CoreData` is old, Apple engineers put a lot of effort to make it available in SwiftUI too.
- To fetch data we have to use another property wrapper called `@FetchRequest` and at this point I start to wonder how many other `PropertyWrappers` are there. 

```swift
@FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
```

- To write data into the database you have to get the `Managed Object Context` first:

```swift
@Environment(\.managedObjectContext) var moc

func saveNewStudent() {
	let student = Student(context: self.moc)
	student.id = UUID()
	student.name = "John Doe"
	
	try? self.moc.save()
}
```

