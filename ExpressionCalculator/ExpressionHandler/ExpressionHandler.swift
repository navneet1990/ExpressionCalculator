//
//  ExpressionHandler.swift
//  ExpressionHandler
//
//  Created by Navneet Singh on 7/21/21.
//

import Foundation

final class ExpressionHandler {
    
    // MARK:- Private variables
    private var calculator: Calculator
    private var parser: ExpressionParser?
    
    // MARK:- Initialization
    init(_ calculator: Calculator = Calculator()) {
        self.calculator = calculator
    }
    
    // MARK:- Public methods
    func processInput(_ input: String) -> String {
        evaluateExpression(for: input)
    }
}

// MARK:- Private methods
private extension ExpressionHandler {
    
    func evaluateExpression(for input: String) -> String {
        do {
            guard isValidExpression(content: input) else  {
                let text = try input.intValue()
                return text
            }
            
            let wordToSymbol = generateWordToSymbol()
            let parenthesesSpace = generateParenthesis()
            
            self.parser = ExpressionParser(expression: input,
                                           symbolsDict: wordToSymbol,
                                           parenthesisDict: parenthesesSpace,
                                           delimiter: Constants.DELIMITER)
            
            let parsedString: [String] = parser?.tokenizeExpression() ?? []
            
            let operatorSymbols = generateOperatorSymbol(wordSymbol: wordToSymbol)
            
            // Tree structure
            let tree = Tree()
            tree.contructATree(tokens: parsedString,
                               operatorSymbols: operatorSymbols,
                               beginExp: Constants.OPEN_PARENTHESIS,
                               endExp: Constants.CLOSE_PARENTHESIS)
            
            let node = try tree.getRoot()
            let finalResult = try solveExpressionTree(node: node)
            return "\(finalResult)"
        } catch (let exception) {
            return exception.localizedDescription
        }
    }
    
    func solveExpressionTree(node: Node) throws -> Int {
        var solution: Int?
        let children = node.getChildren()
        
        if children.isEmpty && !node.isValidOperator() {
            solution = Int(node.getData())
        } else {
            for i in 1..<children.count {
                
                let rootNode = children[0]
                let lastNode = children[i]
                solution = calculator.calculate(operator: node.getData(),
                                                firstOperand: try solveExpressionTree(node: rootNode),
                                                secondOperand: try solveExpressionTree(node: lastNode))
            }
        }
        guard let solution = solution else {
            throw CalculationError.invalidOutput
        }
        return solution
    }
    
    func generateOperatorSymbol(wordSymbol: [String : String]) -> Set<String> {
        let values = Set(wordSymbol.values)
        return values
    }
    
    func generateWordToSymbol() -> [String : String] {
        var dict: [String : String] = [:]
        dict["add"] = Constants.ADD
        dict["multiply"] = Constants.MULTIPLY
        dict["exponent"] = Constants.EXPONENT
        return dict
    }
    
    func generateParenthesis(open: String = Constants.OPEN_PARENTHESIS,
                             close: String = Constants.CLOSE_PARENTHESIS,
                             delimiter: String = Constants.DELIMITER) -> [String : String] {
        var dict: [String : String] = [:]
        dict[open] = open + delimiter
        dict[close] = delimiter + close
        return dict
    }
    
    func isValidExpression(content: String) -> Bool {
        return content.contains(Constants.OPEN_PARENTHESIS) && content.contains(Constants.CLOSE_PARENTHESIS)
    }
}

// MARK:- Constants
private extension ExpressionHandler {
    struct Constants {
        static let ADD = "+"
        static let MULTIPLY = "*"
        static let EXPONENT = "^"
        static let OPEN_PARENTHESIS = "("
        static let CLOSE_PARENTHESIS = ")"
        static let DELIMITER = " "
    }
}
