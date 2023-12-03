
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

let new = captians[]


