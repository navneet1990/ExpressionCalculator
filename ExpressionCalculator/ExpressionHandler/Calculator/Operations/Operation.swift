//
//  Operation.swift
//  ExpressionCalculator
//
//  Created by Navneet Singh on 7/21/21.
//

import Foundation

protocol Operation {
    func calculate(lhs: Int, rhs: Int) -> Int
}
