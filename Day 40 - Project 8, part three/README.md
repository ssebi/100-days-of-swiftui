# Day 40 - Project 8: Moonshot, Part Two
🔗 [HWS Day 40](https://www.hackingwithswift.com/100/swiftui/40)
🔗 [Resources](https://github.com/twostraws/HackingWithSwift)

# 📝 Notes
Covered topics:

- Loading a specific kind of Codable data
- Using generics to load any kind of Codable data
- Formatting our mission view

# Loading a specific kind of Codable data

 - So far we've copied the needed resources, modeled the `Astronaut` struct and loaded the `.json` from `Bundle`.

# Using generics to load any kind of Codable data

 - In this topic we were introduces to the power of generics given by the example of creating a single piece of code that does the decoding from a file in the `Bundle` of any type.

# Formatting our mission view

- We can also write `.scaledToFit()` instead of `.aspectRatio(contentMode: .fit)` to get the same result.
- We've seen how we can add a `.dateDecodingStrategy` to the decoder so that we can deal with dates.