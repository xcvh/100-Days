// from https://www.hackingwithswift.com/100/swiftui/1

import Cocoa

var greeting = "Hello, playground"
var name = "Jeldo"
name = "Luppi"
name = "Arno"

let character = "Luppers"
// character = "Schmuppers"
// This would throw an error, because a constant can't be reasigned.

var playerName = "Bernd"
print(playerName)

playerName = "Ernst"
print(playerName)

// MARK: Strings

let band = "ZZ Top"
let filename = "dogememe.jpg" // Punctuation is fine
let pazzazz = "💎⚡🍌" // So are emojis

let quote = "\"It's fine\" he said." // Escaping with backslash
 
// Multi line string start with """

let poem = """
Die Löcher sind die Hauptsache
an einem Sieb
Ich habe dich so lieb.
"""

print(poem.count) // Reading string length

let poemLength = poem.count
print(poemLength) // This works as well

print(filename.uppercased()) // Calling a method to convert a string into CAPITALS

// Getting a bool back to know wether a string starts with substring
print(poem.hasPrefix("Die Henkel"))

let isJPG = filename.hasSuffix(".jpg")
print(isJPG)

// MARK: Whole Numbers

let score = 10
var reallyBig = 1000000000
reallyBig = 1_000_000_000 // Easier to read with underscores
reallyBig = 1000___00__000_0 // Really stupid, but Swift DGAF

let lowerScore = score - 2
let higherScore = score + 19
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2
print(score)

var counter = 5
counter = counter + 5
counter += 5
counter *= 2
counter -= 10
counter /= 2
print(counter)

counter.isMultiple(of: 3) // Probably false, very handy instead of modulo ...

// MARK: Decimal Numbers

let number = 0.1 + 0.2
print(number) // Whhhhaaaaaat??

let a = 1
let b = 2.0
// This won't work, can't mix types
// let c = a + b
let c = a + Int(b)

// Can't change types either
var fame = "John"
// name = 42

var rating = 5.0
rating *= 2 // But this works somehow...

let multiplier = 2

// let newScore = rating * multiplier
// But this doesn't, not really consistent.
rating = 10 * 2.0

// ??? HMMMM
// That's it for Day 1! Yay!

