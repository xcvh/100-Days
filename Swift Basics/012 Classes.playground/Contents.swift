
// MARK: How to create your own classes

class Game {
    var score = 0 {
        didSet {
            print("Score is now: \(score)")
        }
    }
}

var game = Game()
game.score = 10

// MARK: How to make one class inherit from another

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work for \(hours) hours")
    }
}

class Developer: Employee {
    func work() {
        print("Coding away for \(hours) hours!")
    }
    
    override func printSummary() {
        print("I'm just slacking off.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm in meetings for \(hours) hours")
    }
}

let jm = Developer(hours: 6)
let tk = Manager(hours: 8)

jm.work()
jm.printSummary()
tk.work()
tk.printSummary()

// MARK: How to add initializers for classes


class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

// MARK: How to copy classes
// Try changing class here for struct and see what happens

class User {
    var username = "Anon"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1
var user3 = user1.copy()
user2.username = "xcvh"
user3.username = "jel.do"

print(user1.username)
print(user2.username)
print(user3.username)

// MARK: How to create a deinitializer for a class

class Benutzer {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(self.id) created")
    }
    deinit {
        print("User \(id) deleted")
    }
}

var users = [Benutzer]()

for i in 1...3 {
    let user = Benutzer(id: i)
    print("User \(user.id) working")
    users.append(user)
}

users.removeAll()

// MARK: How to work with variables inside classes

var user4 = User()
user4.username = "Mous"
print(user4.username)
user4 = User()
print(user4.username)

// MARK: Checkpoint 7
//
// Your challenge is this: make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.
//
// But there’s more:
//
// The Animal class should have a legs integer property that tracks how many legs the animal has.
// The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
// The Cat class should have a matching speak() method, again with each subclass printing something different.
// The Cat class should have an isTame Boolean property, provided using an initializer.

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Bark!")
    }
    
    init() {
        super.init(legs: 4)
    }
}

class Chihuahua: Dog {
    override func speak() {
        print("Rrruff!")
    }
}

class ShibaInu: Dog {
    override func speak() {
        print("Konnichiwa!")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    func speak() {
        print("Meow!")
    }
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
}

class Persian: Cat {
    override func speak() {
        print("Purr!")
    }
    
    init() {
        super.init(isTame: true)
    }
}

class Lion: Cat {
    override func speak() {
        print("Roar!")
    }
    
    init() {
        super.init(isTame: false)
    }
}

let laika = Dog()
laika.legs
laika.speak()

let toshiba = ShibaInu()
toshiba.legs
toshiba.speak()

let chanel = Chihuahua()
chanel.legs
chanel.speak()

let grizabella = Cat(isTame: true)
grizabella.isTame
grizabella.legs
grizabella.speak()

let jennyanydots = Persian()
jennyanydots.isTame
jennyanydots.legs
jennyanydots.speak()

let simba = Lion()
simba.isTame
simba.legs
simba.speak()
