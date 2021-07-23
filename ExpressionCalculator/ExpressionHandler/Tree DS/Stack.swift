//
//  Stack.swift
//  ExpressionCalculator
//
//  Created by Navneet Singh on 7/21/21.
//

import Foundation

struct Stack<T> {
    fileprivate var stackData: [T] = []
    
    var isEmpty:Bool{
        return stackData.isEmpty
    }
    var count:Int{
        return stackData.count
    }
    mutating func push(_ object:T) {
        stackData.append(object)
    }
    mutating func pop() -> T? {
        return stackData.popLast()
    }
    func peek() -> T? {
        return (stackData.last)
    }
}
