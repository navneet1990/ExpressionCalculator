//
//  main.swift
//  ExpressionCalculator
//
//  Created by Navneet Singh on 7/21/21.
//

import Foundation

//MARK:- Begin the process
func begin() {

    /// Create the calculator expression handler object
    let calculator = ExpressionHandler()

    var initialArguments: String?

    /// If user choose Expression calculator in console scheme, then predefined command line arguments will be used for first time
    #if CONSOLE
    let readPrompt = CommandLine.arguments
    let final = readPrompt.dropFirst().joined(separator: " ")
    initialArguments = final
    #endif

    /* Will run as infinite loop, so that user dont have to quit the app to do any operation again.
     For the first time user can directly add and evaluate the expression, after then user the press "y" to continue or any other key to finish the operation and exit
     **/
    while true {
        var input: String
        if let arguments = initialArguments {
            input = arguments
            print(arguments)
        } else {
            print("Please enter your expression")
            input = getInput()
        }
        let result = calculator.processInput(input)
        print(result)
        if initialArguments != nil {
            initialArguments = nil
            continue
        }
        print("Please enter \"y\" to continue..")
        guard getInput() == "y" else {
            exit(0)
            break
        }
    }
}

/// Lets Begin
begin()

// MARK:- Private methods
private func getInput() -> String {
    // 1
    let keyboard = FileHandle.standardInput
    // 2
    let inputData = keyboard.availableData
    // 3
    let strData = String(data: inputData,
                         encoding: String.Encoding.utf8)!
    // 4
    return strData.trimmingCharacters(in: CharacterSet.newlines)
}

/*
 Pass the Expression handler object as param, so that we dont have to initialize again and again.
 **/
private func calculate(_ cal: ExpressionHandler) {
    print("Please enter your exparession")
    let input = getInput()
    let result = cal.processInput(input)
    print(result)
}
