import Cocoa
import Foundation

protocol Vehicle {
    var name: String { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    var name: String = ""
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
    
    func openSunroof() {
        print("Sunroof open.")
    }
}

struct Bike: Vehicle {
    var name: String
    
    func travel(distance: Int) {
        print("I'm riding my bike for \(distance)km.")
    }
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("Too slow.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car(name: "Volvo")
commute(distance: 50, using: car)

let bike = Bike(name: "Cowboy")
commute(distance: 2000, using: bike)

func getTravelEstimate(using vehicles: [Vehicle], for distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print(estimate)
    }
}

getTravelEstimate(using: [car, bike], for: 10000)

// MARK: How to use opaque return types

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

getRandomNumber() == getRandomNumber()

// MARK: Hot to create and use extensions

var quote = "   The truth is rarely pure and never simple   "
let trimmedQuote = quote.trimmingCharacters(in: .whitespacesAndNewlines)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

print(quote)
quote.trim()
print(quote)

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

// MARK: How to use custom and memberwise initializer

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

let lotr = Book(title: "Lord of the Rings", pageCount: 2048, readingHours: 30)

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 60
    }
}

let cap = Book(title: "Crime and Punishment", pageCount: 1598)
cap.readingHours

// MARK: Checkpoint 8

// Your challenge is this: make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:
//
// A property storing how many rooms it has.
// A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
// A property storing the name of the estate agent responsible for selling the building.
// A method for printing the sales summary of the building, describing what it is along with its other properties.

protocol Building {
    var rooms: Int { get }
    var cost: Int { get set }
    var nameOfEstateAgent: String { get set }
    
    func printSummary()
}

struct House: Building {
    let rooms: Int
    
    var cost: Int
    
    var nameOfEstateAgent: String
    
    func printSummary() {
        print("A house with \(rooms) rooms, costing $\(cost). Contact \(nameOfEstateAgent) to buy.")
    }
    
    
}

struct Office: Building {
    let rooms: Int
    
    var cost: Int
    
    var nameOfEstateAgent: String
    
    func printSummary() {
        print("An office with \(rooms) rooms, costing $\(cost). Contact \(nameOfEstateAgent) to buy.")
    }
    
}
