//
//  ErrorEnum.swift
//  ExpressionCalculator
//
//  Created by Navneet Singh on 7/22/21.
//

import Foundation

// MARK:- Error enums
enum CalculationError: Error {
    case invalidExpression
    case invalidOutput
}

extension CalculationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidOutput:
            return NSLocalizedString("Invalid Output: Could not calculate the expression", comment: "")
        case .invalidExpression:
            return NSLocalizedString("Invalid Expression: Please enter correct expression", comment: "")
        }
    }
}
