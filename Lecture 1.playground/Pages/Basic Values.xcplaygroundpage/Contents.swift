/*:
 # Basic Values
 
Tradition suggests that the first program in a new language should print the words “Hello, world!” on the screen. In Swift, this can be done in a single line:
*/
print("Hello, world!")
/*:
 ## Variables, Constants and Types

There are two ways to declare a value in Swift - as a variable (`var`) or a constant (`let`).
*/
var myVariable = 42
myVariable = 50
let myConstant = 42

/*:
 A constant or variable must have the same type as the value you want to assign to it. However, you don’t always have to write the type explicitly. Providing a value when you create a constant or variable lets the compiler infer its type. In the example above, the compiler infers that `myVariable` is an integer because its initial value is an integer.
 
 If the initial value doesn’t provide enough information (or if there is no initial value), specify the type by writing it after the variable, separated by a colon.
 
 */
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
/*:
 - Experiment:
 Create a constant with an explicit type of `Float` and a value of `4`.
 */
//Experiment #1
let explictFloat: Float = 4



/*:
 Values are never implicitly converted to another type. If you need to convert a value to a different type, explicitly make an instance of the desired type.
 */
let label = "The width is "
let width = 94
let height: Double = 80
let widthLabel = label + String(width)

/*:
 - Experiment:
 Try removing the conversion to `String` in the assignment of `widthLabel`. What error do you get? (Put error message as the value for `error`). Fix the error before moving on.
 */
//Experiment #2
let error = "Binary operator '+' cannot be applied to operands of type 'String' and 'Int'"

/*:
 ## Strings
 There’s an even simpler way to include values in strings: Write the value in parentheses, and write a backslash (`\`) before the parentheses. This inserts the object's string representation (the value if you called `print`) into the specified string.
 */
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
/*:
 - Experiment:
 Create a string using `\()` to include a summary about how many oranges you have.
 */
//Experiment #3
let orangeSummary = "I have \(oranges) oranges."

//: Use three double quotation marks (`"""`) for strings that take up multiple lines. Indentation at the start of each quoted line is removed, as long as it matches the indentation of the closing quotation marks. For example:
//:
let quotation = """
Double quotes (") can appear without being escaped.

I still have \(apples + oranges) pieces of fruit.
"""

/*:
 ## Arrays and Dictionaries
Create arrays and dictionaries using brackets (`[]`), and access their elements by writing the index or key in brackets. A comma is allowed after the last element.
*/
var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"

//: Arrays automatically grow as you add elements.
//:
shoppingList.append("blue paint")
print(shoppingList)

//: To create an empty array or dictionary, use the initializer syntax `()` or explicit typing.

let initializedEmptyArray = [String]() //Initilized empty [String] object - an array of strings
let initializedEmptyDictionary = [String: Float]() //Initialized empty [String: Float] object - a dictionary with String keys and Float values

let explicitEmptyArray: [String] = []
let explicitEmptyDictionary: [String: Float] = [:]
/*:
 - Experiment:
 Follow the 4 steps below
 1. Create an empty array of type `Double` using initializer syntax
 2. Create an empty dictionary of type `Double: String` using explicit typing
 3. Add a value to the array
 4. Add a key, value pair to the dictionary
 */
//Experiment #4

var initializedEmptyDoubleArray = [Double]()

var initializedEmptyDoubleDictionary = [Double:String]()
var doubleDic[Double:String] = [:]

initializedEmptyDoubleArray.append(1.0)

initializedEmptyDoubleDictionary[1.0] = "a"


//: [Control Flow, Optionals >](@next)

