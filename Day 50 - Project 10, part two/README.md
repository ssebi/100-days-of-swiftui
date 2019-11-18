# Day 50 - Cupcake Corner, Part Two

🔗 [HWS Day 50](https://www.hackingwithswift.com/100/swiftui/50)

🔗 [Resources] (https://github.com/twostraws/HackingWithSwift)


# 📝 Notes

Covered topics:

- Taking basic order details
- Checking for a valid address
- Preparing for checkout

# Taking basic order details

 - In this section we create some basic UI and model for the app. One annoying but that could come up here is a message in the console similar to "*ForEach<Range, Int, Text> count (4) != its initial count (1)*". If you ever see something like this it can be fixed by adding a `id: \.self` parameter to the `ForEach`.
 - The approach taken here is to create a single class which holds our data and pass it to every screen so they all share it

# Checking for a valid address

 - We've seen one of the maybe not so obvious benefits of using a shared class for our data: The address details that we type in the second screen will remain there even if we go to the previous screen and then come back.
 - We've also seen how we can add a computed property in our model that indicates whether the data is valid or not.

# Preparing for checkout

- Now we've also completed the UI for the CheckoutView and we've added a new property in our Order model to store the price. The easy parts are done.