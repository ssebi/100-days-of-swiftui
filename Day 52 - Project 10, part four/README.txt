# Day 52 - Cupcake Corner, Part Four

🔗 [HWS Day 52](https://www.hackingwithswift.com/100/swiftui/52)


# 📝 Notes

Covered topics:

- Cupcake Corner: Wrap up
- Review for Project 10: Cupcake Corner

# Cupcake Corner: Wrap up

 - Throughout this project, we've worked with custom Codable implementations, we've made network requests using the URLSession and we've gained more experience with UI components and controls. We've also seen how we can validate fields by using the `disabled()` modifier.
 - These topics cover the most important basic skills that any iOS Developer should have: Getting user input, validating it, working with data, and sending it over through the internet using HTTP methods.

# 🎯 Challenges

## Challenge 1
>
Our address fields are currently considered valid if they contain anything, even if it’s just only whitespace. Improve the validation to make sure a string of pure whitespace is invalid.

## Challenge 2
>
If our call to placeOrder() fails – for example if there is no internet connection – show an informative alert for the user. To test this, just disable WiFi on your Mac so the simulator has no connection either.

## Challenge 3
>
For a more challenging task, see if you can convert our data model from a class to a struct, then create an ObservableObject class wrapper around it that gets passed around. This will result in your class having one @Published property, which is the data struct inside it, and should make supporting Codable on the struct much easier.