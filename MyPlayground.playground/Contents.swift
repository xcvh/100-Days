import Cocoa

// MARK: For Loops

let platforms = ["iOS", "iPadOS", "macOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os)")
}

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

for i in 1...10 {
    print("The \(i)-times table:")
    
    for j in 1...10 {
        print("     \(j) * \(i) = \(i*j)")
    }
    
    print()
}

for i in 1...5 {
    print(i)
}

for i in 1..<5 {
    print(i)
}

var lyric = "Gators gonna"

for _ in 1...5 {
    lyric += " gate"
}

print(lyric + "!")

// MARK: While loop

var countdown = 10

while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}
print("Go!")

// Random Ints and Doubles
let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

// Blind: We can use this functionality with a while loop to roll some virtual 20-sided dice again and again, ending the loop only when a 20 is rolled – a critical hit for all you Dungeons & Dragons players out there.

var roll: Int = 0
var counter: Int = 0
while roll != 20 {
    roll = Int.random(in: 1...20)
    counter += 1
    print("\(counter): \(roll)")
}


// MARK: Skipping Loop Items

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if !filename.hasSuffix(".jpg") {
        continue
    }
    
    print("Found picture: \(filename)")
}

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)

// MARK: Checkpoint 3 or whatever: Naive FizzBuzz

// The problem is called fizz buzz, and has been used in job interviews, university entrance tests, and more for as long as I can remember. Your goal is to loop from 1 through 100, and for each number:
//
// If it’s a multiple of 3, print “Fizz”
// If it’s a multiple of 5, print “Buzz”
// If it’s a multiple of 3 and 5, print “FizzBuzz”
// Otherwise, just print the number.

for i in 1...100 {
    var result = ""
    if i.isMultiple(of: 3) {
        result += "Fizz"
    }
    if i.isMultiple(of: 5) {
        result += "Buzz"
    }
    if result.isEmpty {
        result += "\(i)"
    }
    print(result)
}
// this works
