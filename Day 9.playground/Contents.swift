import Cocoa

var greeting = "Hello, playground"

// Closures
// Creating
func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser // If you put the parentheses there you are calling the function and assigning its return value back to something else
greetCopy()

// More common
let sayHello = { // Once again not puting round brackets // No parameters
    print("Hi there my friend!")
}

sayHello() // Calling the function

let sayHello2 = { (name: String) -> String in
    return "Hi \(name)"
}

sayHello2("John")

var greetNewCopy: () -> Void = greetUser
greetNewCopy()

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

// Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to closures, anonymous functions, lambdas, and blocks in other programming languages.

// Closures can capture and store references to any constants and variables from the context in which they’re defined

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

let captainFirstTeamM = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

var connectVPN = {
    print("Connected!")
}
connectVPN()

// Short Hand Syntax by functional programming

let captainFirstTeamMF = team.sorted {
    if $0 == "Suzanne" {   return true   }
    else if $1 == "Suzanne" {   return false   }
    
    return $0 < $1
}

let reverseTeam = team.sorted { $0 > $1 }
print(reverseTeam)


// Functional Programming
// Filter // filter() function lets us run some code on every item in the array, and will send back a new array containing every item that returns true for the function

// Filter
let tOnly = team.filter { name in
    if name.hasPrefix("T") == true {
        return true
    }
    
    return false
}

print(tOnly)

let tFOnly = team.filter { $0.hasPrefix("T") }
print(tFOnly)

// Map // map() function lets us transform every item in the array using some code of our choosing, and sends back a new array of all the transformed items
let upperCasedTeam = team.map { name in
    return name.uppercased()
}

print(upperCasedTeam)

let upperFCasedTeam = team.map { $0.uppercased() }

print(upperFCasedTeam)

let randomNumbers = [1,5,8,9]
let stringRandomNumbers = randomNumbers.map { String($0) }
print(stringRandomNumbers)

// Trailing Closure
// Trailing Closure syntax is designed to make Swift code easier to read

func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation…")
    animations()
}

animate(duration: 10.0) {
    print("Fade new screen")
}

// How to accept functions as parameters // Closures
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let rollDice = makeArray(size: 5) {
    return Int.random(in: 1...10)
}

print(rollDice)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("First")
} second: {
    print("Second")
} third: {
    print("Third")
}

let resignation = { (name: String) in
    print("Dear \(name), I'm outta here!")
}
func printDocument(contents: () -> Void) {
    print("Connecting to printer...")
    print("Sending document...")
    contents()
}

func doTricks(_ tricks: () -> Void) {
    print("Start recording now!")
    tricks()
    print("Did you get all that?")
}

func tendGarden(activities: () -> Void) {
    print("I love gardening")
    activities()
}

tendGarden {
    print("Let's grow some roses!")
}

func goCamping(then action: () -> Void) {
    print("We're going camping!")
    action()
}
goCamping {
    print("Sing songs")
    print("Put up tent")
    print("Attempt to sleep")
}

// Checkpoint 5
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
let luckyEvenNumbersF = luckyNumbers.filter { !$0.isMultiple(of: 2) }
let luckyEvenNumbersFS = luckyEvenNumbersF.sorted { $0 < $1 }
let luckyEvenNumbersFSM = luckyEvenNumbersFS.map { String("\($0) is a lucky number") }
print()
print()
print(luckyEvenNumbersFSM)

let finalOutput = luckyNumbers.filter { !$0.isMultiple(of: 2) }.sorted { $0 < $1}.map { String("\($0) is a lucky number")}
print(finalOutput)
