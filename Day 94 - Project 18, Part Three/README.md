# Day 94 - Project 18, Part Three

🔗 [HWS Day 94](https://www.hackingwithswift.com/100/swiftui/94)


# 📝 Notes

Covered topics:
- Wrap up
- Challenges

# Wrap up

- During this project we've touched a really complex topic, how SwiftUI handles layout and geometry. We've learnt about the rules of layout, alignment, positioning, coordinate spaces and how to use the geometry reader to create stunning effects giving a pleasant look and feel to our apps.

# 🎯 Challenges

## Challenge 1

>
Change project 8 (Moonshot) so that when you scroll down in MissionView the mission badge image gets smaller. It doesn’t need to shrink away to nothing – going down to maybe 80% is fine.

## Challenge 2

>
Change project 5 (Word Scramble) so that words towards the bottom of the list slide in from the right as you scroll. Ideally at least the top 8-10 words should all be positioned normally, but after that they should be offset increasingly to the right.

## Challenge 3

>
For a real challenge make the letter count images in project 5 change color as you scroll. For the best effect, you should create colors using the Color(red:green:blue:) initializer, feeding in values for whichever of red, green, and blue you want to modify. The values to input can be figured out using the row’s current position divided by maximum position, which should give you values in the range 0 to 1.