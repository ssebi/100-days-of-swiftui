# Day 49 - Cupcake Corner, Part One

🔗 [HWS Day 49](https://www.hackingwithswift.com/100/swiftui/49)

🔗 [Resources] (https://github.com/twostraws/HackingWithSwift)


# 📝 Notes

Covered topics:

- Cupcake Corner: Introduction
- Adding Codable conformance for @Published properties
- Sending and receiving Codable data with URLSession and SwiftUI
- Validating and disabling forms

# Cupcake Corner: Introduction

- This time we're building an app for ordering cupcakes and we're going to dive deeper into `Codable` and see how flexible it actually is. We're going to need some additional resources for this project, link is above.


# Adding Codable conformance for @Published properties

- Classes that contain `@Published` properties won't compile and we have to do some extra work to make them compile. What we have to do is add an `enum` conventionally called `CodingKeys` into our class that conforms to the `CodingKey` protocol and write some code to manually encode and decode our properties.

```swift
class User: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case name
    }
    @Published var name = "Paul Hudson"

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
```

# Sending and receiving Codable data with URLSession and SwiftUI

- We can send and receive data from the internet by combining the `Codable` protocol and the `URLSession` class.
- The following code exemplifies how we can fetch some data from a url and decode it afterwards:

```swift
    func loadData() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        self.results = decodedResponse.results
                    }

                    // everything is good, so we can exit
                    return
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
```

# Validating and disabling forms

- Sometimes we want to add some validation to our forms to put some constraints over the user input. In SwiftUI we can do that by using the `.disabled` modifier:

```swift
Section {
    Button("Create account") {
        print("Creating account…")
    }
}
.disabled(username.isEmpty || email.isEmpty)
```