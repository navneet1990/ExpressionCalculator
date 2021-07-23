# S-Expression Calculator
An Expression calculator that takes an expression through command line argument, and developed in Swift 5.0


An expression can one of the following:
 - atomic integer i.e. 0, 10, 322 etc 
 - (OPERAND EXP EXP)
    - OPERAND = "add" | "multiply" | "exponent"
    - EXP = atomic integer | (OPERAND EXP EXP)
 
For example here are some valid sample arguments to pass
- 10
- -323 
- (add 10 2)
- (exponent 3 (add 1 (multiply 1 2)))

### Project components
### Calculator:
Provides logic for addition, multiplication, and exponent on integers
### ExpressionParser:
Tokenizes the input by adding spaces around the brackets, replacing "add" and "multiply" 
with + and * respectively, and lastly splitting by spaces.
i.e. (add 1 2) => ["(", "+", "1", "2", ")"] 
### ExpressionCalculator:
Acts like a bridge between ExpressionParser and Calculator. It passes the user argument
to ExpressionParser which returns a tokenized string. ExpressionCalculator converts the tokenized 
string into a Tree. Finally, it traverses the tree, evaluating nodes recursively with 
Calculator.
ExpressionCalculator also defines rules for mapping signs to keywords, brackets and brackets spacing to
maintain integrity for ExpressionParser and Calculator contract.

### Using the Calculator
- Compile the project with `LLVM`
- Run `main.swift` with input argument

### To update or add a new operation to Calculator
#### Pre-compile
1. Implement `Operation` interface i.e `Division` in `Calculator.Operation` package
   - `let divide =  Division())`
2. Add new operation to  `operationsMap` in `Calculator` constructor
   - `operationsMap["/", new Division()]`
3. Create a operator SIGN field i.e "/" in `ExpressionCalculator`
   - `static let DIVIDE = "/"`
4. update `generateWordToSymbol` in `ExpressionCalculator`
   - `dict["divide"] = Constants.DIVIDE`
   
#### In Runtime from ExpressionCalculator
1. Do step 3 and 4 from pre-compile instructions
1. Create new Operation in `ExpressionCalculator`
   - `let subtraction =  Subtraction()`
2. Add SIGN and new operation to the `Calculator` instance
   - `calculator.addUpdateOperation(SUBTRACT, Subtraction())`
   
  ### To run app in command line or console
  
 ## Running from the Command Line
1. Navigate to the project folder `/.../ExpressionCalculator/bin`   on the terminal
2. Run the command  by typing in `./ExpressionCalculator`
3. Make sure to build first on Xcode, every time any modification made in code
4. If executable in bin doesnt run, then build from Xcode, this is because due to your system securtiy apply wont permit to run downloaded app executable file

## Read default Arguments or in Console
1. Just change target scheme to `ExpressionCalculatorInConsole`
2. For Console without launch arguments, open `edit scheme` change the `Build Configuration` to `Debug`
3. For Console with launch arguments, open `edit scheme` change the `Build Configuration` to `Debug console`
4. Note on console, must add parenthesis manually otherwise compiler wont read the closing parenthesis
5. Hit run then

 ## Running Example
 1. Please enter your expression
 2. (add 5 + 10)
 3. 15
 4. Please enter "y" to continue..
 
 if user press 'y'then
 Program will start from "Running example"
 Else program will terminate
 
