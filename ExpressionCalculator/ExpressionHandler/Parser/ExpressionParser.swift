//
//  ExpressionParser.swift
//  ExpressionCalculator
//
//  Created by Navneet Singh on 7/21/21.
//

import Foundation

class ExpressionParser {
    
    //MARK:- Variables
    var expression: String
    var symbolsDict: [String : String]
    var parenthesisDict: [String : String]
    var delimiter: String

    // MARK:- Initialization
    init(expression: String,
         symbolsDict: [String : String],
         parenthesisDict: [String : String],
         delimiter: String) {
        self.expression = expression
        self.symbolsDict = symbolsDict
        self.parenthesisDict = parenthesisDict
        self.delimiter = delimiter
    }

    // MARK:- Public methods
    func tokenizeExpression() -> [String] {
        replaceWordsWithSymbols()
        addSpaceAroundParenthese()
        return splitBySpaces()
    }
}

// MARK:- Private methods
private extension ExpressionParser {

    func addSpaceAroundParenthese() {
        self.parenthesisDict.forEach {[unowned self] (key,value) in
            self.expression = self.expression.replacingOccurrences(of: key,
                                                                   with: value)
        }
    }

    func replaceWordsWithSymbols() {
        self.symbolsDict.forEach {[unowned self] (key,value) in
            self.expression = self.expression.replacingOccurrences(of: key,
                                                                   with: value)
        }
    }

    func splitBySpaces() -> [String] {
        return self.expression.components(separatedBy: delimiter)
    }
}
