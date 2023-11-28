import Cocoa

// MARK: How to create and use closures

// Creating a copy of a function and assigning it to a variable
// Note that when assigning a function to a variable to omit the closing parenthesis,
// otherwise you would assign the functions return value.

func greetUser() {
    print("Hi threre!")
}

greetUser()

var greetCopy = greetUser
greetCopy()

// Directly assigning a function to a constant
// This is called a closure expression.
// Effectively a function that takes no parameters and doesn't return a value

let sayHello = {
    print("Hello!")
}

sayHello()

// A closure that can take parameters would look like this

let sayHewwo = { (name: String) -> String in
    "Hewwo, \(name)"
}

sayHewwo("Moto")

// Thinking about function types
// Callback to line 15, but this time with explicit type
// () means no parameters taken
// -> Void means no return value

var greetFloppy: () -> Void = greetUser

// So, function types depend on the types of the parameters and the return types,
// but not their names. Let's look at this:

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anon"
    }
}

// When we now copy the function into a constant the parameter name get's lost
// It is now data(1989) and not data(for: 1989)

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

// An excursion into array sorting

let team = ["Mario", "Luigi", "Wario", "Toad"]
let sortedTeam = team.sorted()
print(sortedTeam)

// Passing in a custom sorting function,

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Mario" {
        return true
    } else if name2 == "Mario" {
        return false
    }
    
    return name1 < name2
}

// .sorted() can take any function of type (Sting, String) -> Bool as parameter
// (for an array of Strings, of course)

let captianFirstTeam = team.sorted(by: captainFirstSorted)
print(captianFirstTeam)

// Now back to closures.
// Putting them into functions:
// Lets call sorted using a closure!

let toadFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Toad" {
        return true
    } else if name2 == "Toad" {
        return false
    }
    
    return name1 < name2
})

print(toadFirstTeam)

// MARK: Trailing closures and syntactic sugar

// Now since .sorted() know what kind of types it can accept,
// we don't need to be explicit with it
// and don't even need to pass it as a parameter,
// we can just open the clusure directly after the method call.
// Notice the omitted trailing parantheses in this case.
// When we only do one operation we can omit the return keyword
// and fit it all in one line.

let reverse = team.sorted { name1, name2 in name1 > name2 }
print(reverse)

// Even more terse to use $0 and $1 as "anonymous" paramater names.
// We don't even have to give a in keyword, as we don't specify parameter names.

let reReverse = team.sorted { $0 > $1 }
print(reReverse)

// Two more examples

let io = team.filter { $0.hasSuffix("io") }
print(io)

// Naively i would have written this to get the same effect
// So much more code
// Maybe more readable for a beginner,
// But if you get used to the closure syntax it's quite elegant

var ioNaive = [String]()
for char in team {
    if char.hasSuffix("io") {
        ioNaive.append(char)
    }
}
print(ioNaive)

// In the same vein; mapping

let uppercased = team.map { $0.uppercased() }
print(uppercased)

// MARK: Accepting functions as parameters

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let arr = makeArray(size: 5) {
    Int.random(in: 291...700)
}

print(arr)

// Multiple functions as parameter

func doStuffs(a: () -> Void, b: () -> Void, c: () -> Void) {
    print(1)
    a()
    print(2)
    b()
    print(3)
    c()
}

doStuffs {
    print("a")
} b: {
    print("b")
} c: {
    print("c")
}

// MARK: Checkpoint 5

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

luckyNumbers.filter { !$0.isMultiple(of: 2) }.sorted().map {
    print("\($0) is a lucky number")
}
