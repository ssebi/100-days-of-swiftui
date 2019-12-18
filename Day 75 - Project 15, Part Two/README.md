# Day 75 - Accessibility, Part Two

🔗 [HWS Day 75](https://www.hackingwithswift.com/100/swiftui/75)

# 📝 Notes

Covered topics:

- Fixing Guess the Flag
- Fixing Word Scramble
- Fixing Bookworm

# Fixing Guess the Flag

- This game has a fatal flaw when using VoiceOver, it actually reads out the country because that's what we used for the flag image names. To fix that, we've created a new dictionary that stores a description for each flag and we use that as the accessibility label.

# Fixing Word Scramble

- We've now improved accessibility of project 5, WordScramble to group different views together and change the accessibility label of the items in the used words list.

# Fixing Bookworm

- Project 11, Bookworm was also improved to add better accessibility for the RatingView component. It now reads the correct number of stars, it tells the user that it's a button and it can be actioned and it tells if it's highlighted or not.