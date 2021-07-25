//
//  Node.swift
//  ExpressionCalculator
//
//  Created by Navneet Singh on 7/21/21.
//

import Foundation
/*
 We will use tree data Structure, so Node class will be used
 **/
class Node {

    // MARK:- Variables
    var data: String
    var isOperator: Bool
    var children: Array<Node>

    // MARK:- Initialization
    init(data: String, _ isOperator: Bool = true) {
        self.data = data
        self.isOperator = isOperator
        self.children = []
    }

    // MARK:- Public methods
    func getData() -> String {
        return data
    }

    func addChild(child: Node) {
        children.append(child)
    }

    func getChildren() -> Array<Node> {
        return children
    }

    func isValidOperator() -> Bool {
        return isOperator
    }
}
