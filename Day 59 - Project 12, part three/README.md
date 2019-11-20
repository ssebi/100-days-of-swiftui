Day 59 - Core Data, Part Three

🔗 [HWS Day 59](https://www.hackingwithswift.com/100/swiftui/59)


# 📝 Notes

Covered topics:

- Wrap up
- Challenges

# Wrap up

- In this project we've learnt how useful `Core Data` is when we need to store data fast and easy. It's also available on all Apple platforms which is a big plus. Some things are not very straight forward and could use some refinement to match Swift's swiftness.
- We've seen how `\.self` works, how to create our own `NSManagedObject` subclasses, how to ensure uniqueness with `Constraints`, how to filter data using `NSPredicate` and how to build one-to-many relationships. 

# 🎯 Challenges

## Challenge 1

>
Make it accept an array of NSSortDescriptor objects to get used in its fetch request.

## Challenge 2

>
Make it accept a string parameter that controls which predicate is applied. You can use Swift’s string interpolation to place this in the predicate.

## Challenge 3

>
Modify the predicate string parameter to be an enum such as .beginsWith, then make that enum get resolved to a string inside the initializer.