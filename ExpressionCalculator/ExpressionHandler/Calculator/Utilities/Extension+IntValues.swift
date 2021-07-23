//
//  Extension+IntValues.swift
//  ExpressionCalculator
//
//  Created by Navneet Singh on 7/22/21.
//

import Foundation

extension String {
     func intValue() throws -> String  {
        guard let value = Int(self) else{
            throw CalculationError.invalidExpression
        }
        return "\(value)"
    }
}

extension Decimal {
    var intValue: Int {
        return NSDecimalNumber(decimal: self).intValue
    }
}
