import Cocoa

// Checkpoint 1: Temperature conversion

let celsius = 42.0
let fahrenheit = celsius * 9 / 5 + 32
print ("\(celsius)°C is eqal to \(fahrenheit)°F")

let convertedBack = (fahrenheit - 32) * 5 / 9
print(convertedBack)

// Checkpoint 2: FizzBuzz (My solution)

for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
    } else if i.isMultiple(of: 3) {
        print("Fizz")
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(i)
    }
}

// FizzBuzz (Optimized)

for i in 1...100 {
    if i.isMultiple(of: 3) {
        if i.isMultiple(of: 5) {
            print("FizzBuzz")
        } else {
            print("Fizz")
        }
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(i)
    }
}

// Checkpoint 3: Compare two strings to see if they have the same letters
func compareStrings(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}

let stringsEqual = compareStrings(string1: "Scott", string2: "Scotty")
print(stringsEqual)

// Checkpoint 4: Write a function that accepts an integer from 1 through 10000 and returns the integer square root of that number

enum SquareRootError: Error {
    case outOfBounds, noRootError
}

func calculateSquareRoot(_ number: Int) throws -> Int {
    if number < 1 || number > 10000 {
        throw SquareRootError.outOfBounds
    }
    for i in 1...100 {
        if number.isMultiple(of: i) {
            if i == number/i {
                return i
            }
        }
    }
    throw SquareRootError.noRootError
}

let number = 3
do {
    let root = try calculateSquareRoot(number)
    print("The square root of \(number) is \(root).")
} catch SquareRootError.outOfBounds {
    print("Sorry, \(number) is not within the specified range – please specify a value from 1 through 10,000.")
} catch SquareRootError.noRootError {
    print("Sorry, we could not find an integer square root for \(number).")
} catch {
    print("Sorry, there was a problem.")
}

// Checkpoint 5: Closures

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
let mappedEvenNumbers = luckyNumbers.filter {!$0.isMultiple(of: 2)}.sorted().map {"\($0) is a lucky number"}

for number in mappedEvenNumbers {
    print("\(number)")
}

// Checkpoint 6: Structs

struct Car {
    let model: String
    let numberOfSeats: Int
    
    let numberOfGears: Int
    private(set) var currentGear: Int
    
    mutating func changeGearTo(_ gear: Int) {
        if gear >= 1 && gear <= numberOfGears {
            currentGear = gear
        } else {
            print("Enter a gear between 1 and \(numberOfGears).")
        }
    }
}

var car = Car(model: "Pilot", numberOfSeats: 8, numberOfGears: 9, currentGear: 1)
car.changeGearTo(10)
print(car.currentGear)

// Checkpoint 7: Classes

class Animal {
    let legs: Int
    
    init(legs:Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Ruff, ruff, ruff")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(isTame: Bool, legs: Int) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("Meow")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Woof!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Woof, woof!")
    }
}

class Persian: Cat {
    override func speak() {
        print("Meow, meow")
    }
}

class Lion: Cat {
    override func speak() {
        print("ROAR!!")
    }
}

var persian = Persian(isTame: true, legs: 4)
print(persian.legs)
persian.speak()

var corgi = Corgi(legs: 4)
print(corgi.legs)
corgi.speak()

// Checkpoint 8: Protocols and Extensions

protocol Building {
    var type: String {get}
    var rooms: Int {get}
    var cost: Int {get set}
    var agent: String {get set}
    
    func printSalesSummary()
}

extension Building {
    func printSalesSummary() {
        print("This \(type) has \(rooms) rooms, costs \(cost), and is listed by \(agent).")
    }
}

struct House: Building {
    let type = "house"
    var rooms: Int
    var cost: Int
    var agent: String
}

struct Office: Building {
    let type = "office"
    var rooms: Int
    var cost: Int
    var agent: String
}

let office = Office(rooms: 10, cost: 400_000, agent: "Scott Johnson")
office.printSalesSummary()

// Checkpoint 9: Optionals

func randomNumberFrom(array: [Int]?) -> Int? {
    return array?.randomElement() ?? Int.random(in: 1...100)
}

if let randomNumber = randomNumberFrom(array: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) {
    print(randomNumber)
}

let anotherArray: [Int]? = nil
if let anotherRandomNumber = randomNumberFrom(array: anotherArray) {
    print(anotherRandomNumber)
}
