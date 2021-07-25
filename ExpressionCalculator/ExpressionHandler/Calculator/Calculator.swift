//
//  Calculator.swift
//  ExpressionCalculator
//
//  Created by Navneet Singh on 7/21/21.
//

import Foundation

final class Calculator {

    // MARK:- Private variables
    private var operationMap: [String : Operation]

    // MARK:- Initialization
    init() {
        self.operationMap = ["+" : Addition(),
                             "*" : Multiplication(),
                             "^" : Exponent()
        ]
    }

    // MARK:- Public methods
    /*
     Add or update new SIGN and operation of instance of this class
     **/
    func addUpdateOperation(operator symbol: String,
                            operation: Operation) {
        if let _ = operationMap[symbol] {
            operationMap[symbol] = operation
        } else {
            operationMap[symbol] = operation
        }
    }

    /*
     From mapped operation based upon symbol, actual calculation will be performed
     **/
    func calculate(operator symbol: String,
                   firstOperand lhs: Int,
                   secondOperand rhs: Int) -> Int? {
        guard let operation = operationMap[symbol] else {
            return nil
        }
        return operation.calculate(lhs: lhs, rhs: rhs)
    }
}
