import Cocoa

// MARK: Checking Bools

/*
 if someCondition {
    print("Some statement")
 }
 This won't work as someCondition is not yet defined.
*/

let score = 80
if score > 70 {
    print("Pass!")
}

let speed = 88
let percentage = 85
var age = 18

if speed >= 88 {
    print("Too fast!")
}

if percentage < 85 {
    print("F")
}

if age >= 18 {
    print("Adulting")
}

// Now let's try it with string ordering.

let myName = "Jeldo"
let hisName = "Luppi"

if myName > hisName {
    print("It's \(myName) vs \(hisName)")
}

if hisName > myName {
    print("It's \(hisName) vs \(myName)")
}

let player1 = "Scott Pilgrim"
let theRest = "the World"

print("\(player1) vs \(theRest)")

// Trying blind: if adding a number to an array makes it contain more than 3 items, remove the oldest one.

var threeNumbers = [1,2,3]

threeNumbers.append(4)

if threeNumbers.count > 3 {
    threeNumbers.removeFirst()
}

print(threeNumbers)

// The equals and the equalsequals

let jazzArtist = "Nala Sinephro"

if jazzArtist == "Nala Sinephro" {
    print("Excellent")
}

if jazzArtist != "Yussef Dayes" {
    print("Why not?")
}

var bestBand: String = ""

if bestBand.isEmpty {
    bestBand = "Model/Actriz"
}

print("The best concerts this year were from \(bestBand)")

age = 14

if age >= 18 {
    print("Vote!")
} else {
    print("No Vote!")
}

let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if a and b are false")
}

let temp = 25
if temp > 20 {
    if temp < 30 {
        print("it's nice out")
    }
}

// Thats a bit wordy

if temp > 20 && temp < 30 {
    print("Better")
}

let hasConsent = true

if age >= 18 || hasConsent {
    print("Sure, buy GTA6")
}

/*
 Blind try:
 In this example we’re going to create an enum called TransportOption, which contains five cases: airplane, helicopter, bicycle, car, and scooter. We’ll then assign an example value to a constant, and run some checks:
 
 If we are going somewhere by airplane or by helicopter, we’ll print “Let’s fly!”
 If we’re going by bicycle, we’ll print “I hope there’s a bike path…”
 If we’re going by car, we’ll print “Time to get stuck in traffic.”
 Otherwise we’ll print “I’m going to hire a scooter now!”
*/

enum TransportOption {
    case airplane, helicopter, bicycle, carr, scooter
}

let v = TransportOption.carr

if v == .airplane || v == .helicopter {
    print("Let's fly")
} else if v == .bicycle {
    print("Not in the US, Buddy!")
} else if v == .carr {
    print("Let's ride Jimmy!")
} else {
    print("Vroom vroom, scooter tooter")
}

// MARK: Let's switch it up!

enum Condition {
    case sun, rain, snow, wind, unknown
}

let forecast = Condition.wind

switch forecast {
case .sun:
    print("Sunman")
case .rain:
    print("Rainman")
case .snow:
    print("Snowman")
case .wind:
    print("Windman")
case .unknown:
    print("Brokenman")
}

switch myName {
case "Luppi":
    print("Luppers")
case "Jeldo":
    print("Yes")
default:
    print("")
}

// MARK: Fallthrough

let day = 3
print("My true love gave to me...")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}

// MARK: Ternary ? Opera : tor

let canVote = age >= 18 ? "Yes" : "No"
print(canVote)

let hour = 23
print(hour < 12 ? "AM" : "PM")

var names = ["James", "Jesus"]
var crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)
names.removeAll()
crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

// Hard to read?

enum Theme {
    case darkMode, lightMode
}

let currentTheme = Theme.darkMode
let background = currentTheme == .darkMode ? "#000000" : "#FFFFFF"
print(background)


