
// MARK: Optionals?

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi",
    "Toad": "Watoad"
]

let peachOpposite = opposites["Peach"]
if let marioOpposite = opposites["Mario"] {
    print("Mario's opponent is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedUsername = username {
    print(unwrappedUsername)
} else {
    print("Empty")
}

// is equal to

if let username = username {
    print(username)
} else {
    print("Empty")
}

// which also is equal to

if let username {
    print(username)
} else {
    print("Empty")
}

func square(number: Int) -> Int {
    number * number
}

var number: Int? = 16
// print(square(number: number)) Not allowed

if let number {
    print(square(number: number))
}

// MARK: Guard

func printSquare(of number: Int?) {
    guard let number else {
        print("Missing input")
        return
    }
    
    print("\(number) x \(number) = \(number * number)")
}

var myVar: Int? = 3
var nyVar: Int?

printSquare(of: myVar)
printSquare(of: nyVar)

// MARK: Nil coalescing ?? "Yes"

let captians = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captians["Serenity"] ?? "N/A"

let tvShows = ["Akuma-kun", "Pluto", "Monster", "NGE"]
let fav = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Edda", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let num = Int(input) ?? 0
print(num)

// MARK: Optional chaining

var buch: Book? = nil
buch = Book(title: "lolita", author: "nabokov")
let auth = buch?.author?.first?.uppercased() ?? "A"

// MARK: try?

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.badID
}

if let user = try? getUser(id: 34) {
    print(user)
}

let user = (try? getUser(id: 32)) ?? "Anon"
print(user)

// MARK: Checkpoint 9

func rand(from array: [Int]?) -> Int { array?.randomElement() ?? Int.random(in: 1...100) }

var testArray = [Int]()
for i in 101...200 {
    testArray.append(i)
}

rand(from: testArray)
rand(from: nil)
