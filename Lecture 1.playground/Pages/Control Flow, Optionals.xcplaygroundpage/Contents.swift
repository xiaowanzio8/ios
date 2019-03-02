/*:
 # Control Flow, Optionals
 [< Basic Values](@previous)
 ## For loops, If statements
 Use `if` and `switch` to make conditionals, and use `for`-`in` and `while` to make loops. Parentheses around the condition or loop variable are optional. Braces `{}` around the body are required.
 */
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

/*:
 In an `if` statement, the conditional must be a Boolean expression. For example, code such as `if score { ... }`, doesn't implicitly compare `score` to 0 (like Python) and must be `if score != 0 { ... }`.

 Use `while` to repeat a block of code until a condition changes. The condition of a loop can be at the end instead using `repeat`, ensuring that the loop is run at least once.
*/
var n = 2
while n < 100 {
    n *= 2
}

var i = 2
repeat {
    i *= 2
} while i < 100

print(n)
/*:
 - Experiment:
 Write your own `while` loop and `repeat` loop that each execute 100 times.
 */

//Experiment #5
var a = 1
repeat{
    a += 2
} while a < 500

while a < 1000{
    a += 2
}

/*:
 ## Optionals
 Swift introduces "optional" types, a feature at the core of the language. An optional is any variable that *has the possibility* of not having a value (`nil` in Swift). Optionals are marked with a `?` at the end of a variable's type. *Nothing can have the value `nil` in Swift unless it is marked as an optional*.
 */
var definitelyNotNil: String = "I'm definitely not nil"
var optionallyNil: String? = "Maybe I'm nil, maybe not!"
print(optionallyNil == nil)
optionallyNil = nil //Just fine

/*:
 - Experiment:
 Try setting definielyNotNil to nil. What error do you get?
 */
//Experiment #6
let nilError = "Nil cannot be assigned to type 'String'"  //Put error text here

/*:
 You can use `if` and `let` together to work with optional values using the format `if let constant = optional {...}`.
 
 If the optional value is `nil`, the if statement is `false` and the code in braces is skipped. Otherwise, the optional value is "unwrapped" and assigned to the constant after `let`, which makes the new value available inside the block of code.
 */
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"

optionalName = nil
if let name = optionalName {
    greeting = "Hello, \(name)"
}
/*:
 - Experiment:
 Change `optionalName` to `nil`. What greeting do you get? Add an `else` clause that sets a different greeting if `optionalName` is `nil`.
 */
//Experiment #7
let greetingText = "nil" //Put the value of `greeting` here
//: Another way to handle optional values is to provide a default value using the `??` operator. If the optional value is missing, the default value is used instead.

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)" //nickName if not nil, fullName otherwise
/*:
 ## Switch statements
 Switch statements are a quick way to execute code based on the value of a variable instead of using a series of `if` statements. `if x = something {...} if x = something else {...}` etc.
 */
let vegetable = "cucumber"

switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
default:
    print("Everything tastes good in soup.")
}

//: - Experiment:
//: Try removing the default case. What error do you get?
//Experiment #8
let defaultError = ""

//: Notice how `let` can be used in a pattern to assign the value that matched the pattern to a constant.
//:
//: After executing the code inside the switch case that matched, the program exits from the switch statement. Execution doesn’t continue to the next case, so there is no need to explicitly break out of the switch at the end of each case’s code.
//:

//: ## For-In loops
//: You use `for`-`in` to iterate over items in a dictionary by providing a pair of names to use for each key-value pair. Dictionaries are an unordered collection, so their keys and values are iterated over in an arbitrary order.
//:
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [8, 5, 3, 2, 1, 1],
    "Square": [1, 4, 9, 16, 25],
]
var largestNumber = Int.min
var largestType = ""
for (type, numbers) in interestingNumbers {
    for number in numbers {
        if number > largestNumber {
            largestNumber = number
            largestType = type
        }
    }
}
print(largestType, largestNumber)

//: - Experiment:
//: Write a nested `for` loop to check for the *smallest* number and type.
//Experiment #9





