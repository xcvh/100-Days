
// MARK: Structs

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    enum Format {
        case album, single, ep, liveRecording
    }
    
    let format: Format
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let baitOnes = Album(title: "Leak 04-13 (Bait Ones)", artist: "Jai Paul", year: 2013, format: .album)

let fightNight = Album(title: "Fight Night", artist: "Girl and Girl", year: 2023, format: .liveRecording)

baitOnes.printSummary()

// Employment

struct Employee {
    let name: String
    var vacationAllocated: Int = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
        
    }
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationTaken += days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Not enough days.")
        }
    }
}

var luppi = Employee(name: "Luppi", vacationTaken: 0)
let me = Employee(name: "Jeldo", vacationTaken: 4)
var dave = Employee(name: "Dave")

luppi.takeVacation(days: 2)
// Works just fine
// me.takeVacation(days: 3)
// Swift refuses

// Getter Setter Magic
dave.takeVacation(days: 10)
dave.vacationRemaining = 5
print(dave.vacationRemaining)
// Uses the default value

// MARK: Property observers

struct Game {
    var score: Int = 0 {
        didSet {
            print("Score was \(oldValue); is now \(score).")
        }
    }
}

var game = Game()
game.score += 10

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue.count)")
        }
    }
}

var app = App()
app.contacts.append("Me")
app.contacts.append("Myself")
app.contacts.append("I")

// MARK: Custom initializers

struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        self.number = Int.random(in: 1...70)
    }
}

let jordan = Player(name: "Jordan")
jordan.number

// Just remember the golden rule:
// all properties must have a value by the time the initializer ends.
