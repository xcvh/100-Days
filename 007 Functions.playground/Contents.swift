import Cocoa

// MARK: Functions

func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want")
}

showWelcome()

let number = 139

if number.isMultiple(of: 2) {
    print("Even")
} else {
    print("Odd")
}

let roll = Int.random(in: 1...20)

func printTimesTable(number: Int) {
    for i in 1...12 {
        print("\(i) times \(number) is \(i*number)")
    }
}

printTimesTable(number: 5)

func printTimesTableForRange(number: Int, range: Int) {
    for i in 1...range {
        print("\(i) times \(number) is \(i*number)")
    }
}

printTimesTableForRange(number: 5, range: 5)

// MARK: Returning

let root = sqrt(169)
print(root)

func rollDie(sides: Int) -> Int {
    Int.random(in: 1...sides)
}

let result = rollDie(sides: 6)
print(result)

func isAnagram(_ firstWord: String, _ secondWord: String) -> Bool {
    firstWord.sorted() == secondWord.sorted()
}

print(isAnagram("lager", "regal"))

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(pow(a, 2) + pow(b, 2))
}

pythagoras(a: 3, b: 4)

// MARK: Returning more than one value

// Arrays: Not Good
func getUserArr() -> [String] {
    ["Taylor", "Swift"]
}

let user = getUserArr()
print("Name: \(user[0]) \(user[1])")

// Dicts: Not Good
func getUserDict() -> [String: String] {
    [
        "firstName": "Caylor",
        "secondName": "Twift"
    ]
}

let userD = getUserDict()
print("\(userD["firstName"]) + \(userD["secondName"])")

// Tuples to the rescue
func getUserTuple() -> (firstName: String, lastName: String) {
    (firstName: "Maylor", lastName: "Dwift")
}

let userT = getUserTuple()
print("\(userT.firstName) \(userT.lastName)")

// This is allowed as well
func getUserTuple2() -> (firstName: String, lastName: String) {
    ("Baylor", "Pwift")
}

// Or even this, but it gives up some readability
func getUserTuple3() -> (String, String) {
    ("Haylor", "Lwift")
}

// Extracting values from tuples
let user2 = getUserTuple3()
let firstName = user2.0
let lastName = user2.1

print("\(firstName) \(lastName)")

// All in one step
let (fName, lName) = getUserTuple2()
print("\(fName) \(lName)")

// Ignoring a tuple value
let (blame, _) = getUserTuple()
print(blame)


// MARK: Parameter Labels
func rollDice(sides: Int, count: Int) -> [Int] {
    var rolls = [Int]()
    for _ in 1...count {
        rolls.append(Int.random(in: 1...sides))
    }
    return rolls
}

print(rollDice(sides: 6, count: 10))

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let itB = isUppercase(string)


func printTimesTable2(for number: Int) {
    for i in 1...12 {
        print("\(i) times \(number) is \(i*number)")
    }
}

printTimesTable2(for: 3)
