import Cocoa

// MARK: Booleans


let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

let goodBoi = true
let gameOver = false

let isMutliple = 420.isMultiple(of: 69)

// Flipping Bools

var isAuth = false
isAuth = !isAuth
print(isAuth)
isAuth = !isAuth
print(isAuth)

isAuth.toggle() // Now that's way easier

// MARK: Concats

let firstPart = "Hello, "
let secondPart = "World!"
let greeting = firstPart + secondPart

print(greeting)

print(greeting + "!!")

// MARK: Interpol

let name = "xcvh"
let age = 35
let message = "This year \(name) turned \(age)"

// Compare this

let mission: Int = 11

// print("Apollo " + mission + " landed on the moon.")
// Not even allowed

print("Apollo " + String(mission) + " landed on the moon")
// Needs type-casting and concatenation

print("Apollo \(mission) landed on the moon.")
// So simple and elegant!

print("5 x 5 is \(5*5)")
// Even calculation works.

print("420%69=0? \(420.isMultiple(of: 69))")
// Or whole method calls.

// MARK: Temperature Conversion

let tempInCelsius = 32.0
let tempInFahrenheit = tempInCelsius * 9 / 5 + 32
print("\(tempInCelsius)℃ is \(tempInFahrenheit)℉")
