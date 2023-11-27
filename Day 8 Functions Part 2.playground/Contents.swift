
// MARK: Defaults in functions

func printTimesTable(for number: Int, end: Int = 10) {
    for i in 1...end {
        print("\(i*number)")
    }
}

printTimesTable(for: 5, end: 5)
printTimesTable(for: 2)

// MARK: Errorhandling in functions

// Begin by defining possible errors via extending swifts Error type

enum PasswordError: Error {
    case short, obvious
}

// Now we write a function that triggers (or rather handles possible) Errors

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

// Now run the function and handle errors

do {
    let pr = try checkPassword("12345")
    print("Password Rating: \(pr)")
} catch PasswordError.short {
    print("Password too short")
} catch PasswordError.obvious {
    print("Too obvious.")
} catch {
    print("General error.")
}


do {
    let pr = try checkPassword("pass")
    print("Password Rating: \(pr)")
} catch PasswordError.short {
    print("Password too short")
} catch PasswordError.obvious {
    print("Too obvious.")
} catch {
    print("General error.")
}


do {
    let pr = try checkPassword("swanani90")
    print("Password Rating: \(pr)")
} catch PasswordError.short {
    print("Password too short")
} catch PasswordError.obvious {
    print("Too obvious.")
} catch {
    print("General error.")
}

// MARK: Checkpoint 4

// The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:

// You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
// If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
// You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
// If you can’t find the square root, throw a “no root” error.

enum RootError: Error {
    case outOfBound, noRoot
}

func squareRoot(of number: Int) throws -> Int {
    var result: Int = 0
    
    if number < 1 || number > 10_000 {
        throw RootError.outOfBound
    }
    
    for i in 1...100 {
        if number / i == i {
            result = i
        }
    }
    
    if result == 0 {
        throw RootError.noRoot
    }
    
    return result
}

do {
    let num = 64
    let sqr = try squareRoot(of: num)
    print("Sqrt of \(num) is \(sqr)")
} catch RootError.outOfBound {
    print("OOB")
} catch RootError.noRoot {
    print("No Root")
}
