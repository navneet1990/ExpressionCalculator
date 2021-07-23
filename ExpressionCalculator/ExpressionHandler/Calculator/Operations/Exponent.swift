//
//  Exponent.swift
//  ExpressionCalculator
//
//  Created by Navneet Singh on 7/22/21.
//

import Foundation

class Exponent: Operation {
    func calculate(lhs: Int, rhs: Int) -> Int {
        return pow(Decimal(lhs), rhs).intValue
    }
}
