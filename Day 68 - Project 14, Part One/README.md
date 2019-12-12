# Day 68 - Bucket List, Part One

🔗 [HWS Day 68](https://www.hackingwithswift.com/100/swiftui/68)

# 📝 Notes

Covered topics:

- Bucket List: Introduction
- Adding conformance to Comparable for custom types
- Writing data to the documents directory
- Switching view states with enums

# Bucket List: Introduction

>
In this project we’re going to build an app that lets the user build a private list of places on the map that they intend to visit one day, add a description for that place, look up interesting places that are nearby, and save it all to the iOS storage for later.

# Adding conformance to Comparable for custom types

- Swift is doing a great job at comparing built-in types such as `Bool`, `Int` or `String` but it has no idea how to compare custom types like a user defined struct. To tell Swift how to compare those custom types you can implement the `Comparable` protocol.

# Writing data to the documents directory

- In order to write data to the documents directory we use the `FileManager` class. To write a `String` we need three things: a `URL`, a boolean indicating its atomicity and the character encoding. 

# Switching view states with enums

- A great way to handle app state is by using enums as in the following example:

```swift
enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct ContentView: View {
    var loadingState = LoadingState.loading

    var body: some View {
        Group {
            if loadingState == .loading {
                LoadingView()
            } else if loadingState == .success {
                SuccessView()
            } else if loadingState == .failed {
                FailedView()
            }
        }
    }
}
```