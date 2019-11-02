# Day 31 - Project 5: Word Scramble, Part Three
🔗 [HWS Day 31](https://www.hackingwithswift.com/100/swiftui/31)

# 📝 Notes
Covered topics:
- Wrap up
- Challenges

# Wrap up

In this project we've covered `List`, `onAppear`, `Bundle`, `fatalError()`, `UITextChecker` and others. We've also seen how different Objective-C is compared to Swift and that makes us realize how far we've come and how much Swift has evolved.

# Challenge

## Challenge 1
>
Disallow answers that are shorter than three letters or are just our start word. For the three-letter check, the easiest thing to do is put a check into isReal() that returns false if the word length is under three letters. For the second part, just compare the start word against their input word and return false if they are the same.

Challenge 2
>
Add a left bar button item that calls startGame(), so users can restart with a new word whenever they want to.

Challenge 3
>
Put a text view below the List so you can track and show the player’s score for a given root word. How you calculate score is down to you, but something involving number of words and their letter count would be reasonable.
