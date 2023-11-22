import Cocoa

// MARK: Arrays

var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [1, 2, 4, 8, 16, 32, 64]
var temperatures = [25.3, 28.2, 26.4]

print(beatles[0])
print(numbers[1])
print(temperatures[2])

beatles.append("Yoko Ono")

var moreNumbers = numbers
for i in [128, 256, 512, 1024] {
    moreNumbers.append(i)
}
moreNumbers.append(2048)

// temperatures.append("String") // No strings attacheable.

var scores = Array<Int>()
scores.append(100)
scores.append(89)
scores.append(22)
print(scores[1])

// Array declaration

var albums = Array<String>() // Long and tedious
albums.append("Divorce+")

var bands = [String]() // Short and fun
bands.append("Girl and Girl")

var rating = [5.0] // When you already know a value, this is the best way

// Other methods

print(moreNumbers.count)
moreNumbers.remove(at: 0)
print(moreNumbers[0])
moreNumbers.removeAll()
print(moreNumbers.count)

beatles.contains("Ringo")
numbers.contains(3)

print(temperatures.sorted())
let reversedNumbers = numbers.reversed()
print(reversedNumbers)
for num in reversedNumbers {
    print(num)
}

// MARK: Dictionaries

var employee = ["Jeldo", "Digital Solutionist", "Münster"]
print("Name: \(employee[0])")
print("Job: \(employee[1])")
print("Location: \(employee[2])")
// This sucks, try employee.remove(at: 1)

// Let's whip our dict out instead!
// Not a rick roll: https://www.youtube.com/watch?v=4qJ9lOOYAQg

var employee2 = [
    "name": "Jeldo",
    "job": "Digital Solutionist",
    "location": "Münster"
]

print(employee2["name"])
print(employee2["job"])
print(employee2["location"])
print(employee2["password"]) // Oh my, there is nil there.
print(employee2["password", default: "No password set."]) // That's better.

let hasGraduated = [
    "Jeldo": false,
    "Luppi": false,
    "Ave": true
]

let yearBorn = [
    1988: "Jeldo",
    1991: "Daaje"
]

print(yearBorn[2000, default: "Some Zoomer"])

// Empty dict
var heights = [String: Int]()
heights["Luppi"] = 164
heights["Jeldo"] = 190

heights["Jeldo"] = 186 // I'm actually not that tall


// MARK: Sets
var people = Set(["Denzel", "Tom", "Nicolas", "Samuel"])

print(people)
people.insert("Uma")

var intSet = Set<Int>()
intSet.insert(11)
intSet.insert(13)
intSet.insert(15)
print(intSet)

print(intSet.sorted())

// MARK: Enumerations

var selected = "Monday"
selected = "Tuesday"
selected = "January"
// Not good, that is not good
selected = "Friday "
// Ugh even worst

enum Weekday {
    case Monday
    case Tuesday
    case Wedneday
    case Thursday
    case Friday
}

enum Weekend {
    case Saturday, Sunday
}

let day = Weekday.Friday // Way better
let firstDayOfWeek = Weekend.Sunday // Ugh, ameircans

// That's it! 💚

