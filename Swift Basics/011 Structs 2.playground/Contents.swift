
// MARK: Structs 2: How to limit access to internal data using access control

struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

// This won't work anymore
// account.funds -= 1000
// But this will, since it's only reading the value
print(account.funds)

// MARK: Static properties and methods

// Static properties are not availabe on instances,
// but on the struct itself. It can be a nice way to bundle variables.

struct AppData {
    static let version = "1.4 Beta 1"
    static let saveFilename = "settings.json"
    static let website = "https://www.jel.do"
}

// Or it can be useful for storing example data when working in SwiftUI

struct Album {
    let artists: [String]
    let title: String
    let year: Int
    let appleMusicLink: String?
    
    static let example = Album(artists: ["Sam Gendel","Sam Wilkes"],
                               title: "Music for Saxophone & Bass Guitar",
                               year: 2018,
                               appleMusicLink: "https://music.apple.com/de/album/music-for-saxofone-bass-guitar/1389926275?l=en-GB")
}

let fuubutsushi = Album(artists: ["Fuubutsushi"], title: "Fuubutsushi", year: 2020, appleMusicLink: nil)

// fuubutsushi.example
// Static member 'example' cannot be used on instance of type 'Album'

Album.example.year

// MARK: Checkpoint 6:

// To check your knowledge, here’s a small task for you: create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear = 0
    
    mutating func shiftUp() {
        if currentGear < 10 {
            currentGear += 1
            print("Gear is now: \(currentGear)")
        } else {
            print("You are already in maximum gear!")
        }
    }
    
    mutating func shiftDown() {
        if currentGear > 0 {
            currentGear -= 1
            print("Gear is now: \(currentGear)")
        } else {
            print("You are already in minimum gear!")
        }
    }
    
    mutating func shift(to gear: Int) {
        if gear >= 0 && gear <= 10 {
            currentGear = gear
            print("Gear is now: \(currentGear)")
        } else {
            print("Invalid gear!")
        }
    }
}


var golf = Car(model: "Golf", numberOfSeats: 5, currentGear: 8)

golf.shiftUp()
golf.shiftUp()
golf.shiftUp()
for _ in 1...11 {
    golf.shiftDown()
}
