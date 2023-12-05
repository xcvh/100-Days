import Cocoa

// MARK: Type Annotations

// With type inference
let surname = "Lasso"
var score = 0

// With type annotations
var rating: Double = 0
let playerName: String = "Ted"
let luckyNumber: Int = 13
let truth: Bool = false
let getSet: Set<Int32> = Set([34,35,12])
let dict: [String: Int] = ["Ben": 10]

// All the empty arrays
let albums: [String] = []
var sodas: [String] = [String]()
var clues = [String()]

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.system
style = .dark

// let declaration, set later?
let username: String
username = "xcvh"
print(username)

// MARK: Checkpoint 2
// This time the challenge is to create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array.

let words: [String]
words = ["ONE", "TWO", "ONE", "TWO", "MICROPHONE", "CHECK"]
let wordsSet = Set(words)
print(words.count)
print(wordsSet.count)
