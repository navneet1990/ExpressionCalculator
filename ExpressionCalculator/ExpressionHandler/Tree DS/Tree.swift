//
//  Tree.swift
//  ExpressionCalculator
//
//  Created by Navneet Singh on 7/21/21.
//

import Foundation

class Tree {

    // MARK:- Variables
    private var root: Node?

    // MARK:- Public methods
    func getRoot() throws -> Node {
        guard let root = self.root else {
            throw CalculationError.invalidOutput
        }
        return root
    }

    /*
    Tree data structure will construct the tree from operators,tokens. This is improve the performance of parsing large expression with mutiple operators and operands
     **/
    func contructATree(tokens: [String],
                       operatorSymbols: Set<String>,
                       beginExp: String,
                       endExp: String) {
        var root: Stack<Node> = Stack()

        for object in tokens {
            if object == beginExp {
                continue
            }
            if operatorSymbols.contains(object) {
                root.push(Node(data: object))
            }
            else if object == endExp,
                    let temp = root.pop() {
                if root.isEmpty {
                    self.root = temp
                } else if let tail = root.peek() {
                    tail.addChild(child: temp)
                }
            } else if let temp = root.pop() {
                temp.addChild(child: Node(data: object, false))
                root.push(temp)
            }
        }

    }
}
