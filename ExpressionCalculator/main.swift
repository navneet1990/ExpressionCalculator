//
//  main.swift
//  ExpressionCalculator
//
//  Created by Navneet Singh on 7/21/21.
//

import Foundation

func begin() {
    let calculator = ExpressionHandler()

    var initialArguments: String?
    #if CONSOLE
    let readPrompt = CommandLine.arguments
    let final = readPrompt.dropFirst().joined(separator: " ")
    initialArguments = final
    #endif

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
private func calculate(_ cal: ExpressionHandler) {
    print("Please enter your exparession")
    let input = getInput()
    let result = cal.processInput(input)
    print(result)
}
