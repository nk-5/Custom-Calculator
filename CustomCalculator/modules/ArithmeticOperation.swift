//
//  ArithmeticOperation.swift
//  CustomCalculator
//
//  Created by 中川 慶悟 on 2017/02/17.
//  Copyright © 2017年 Keigo Nakagawa. All rights reserved.
//

import Foundation

enum ArithmeticError: Error {
    case ZeroDivide
}

class ArithmeticOperation {
    public func plus(a: Float!, b: Float!) -> Float {
        return a + b
    }

    public func minus(a: Float!, b: Float!) -> Float {
        return a - b
    }

    public func multiply(a: Float!, b: Float!) -> Float {
        return a * b
    }

    public func divide(a: Float!, b: Float!) -> Float {
        return a / b
    }

    public func zeroDivide() throws {
        throw ArithmeticError.ZeroDivide
    }

    // Tax in Value is round
    public func taxIn(a: Float) -> Float {
        let tax: Float = 1.08
        return (a * tax).rounded()
    }

    public func hasStrContainPoint(str: String?) -> Bool {
        guard let str: String = str else {
            return false
        }
        return str.contains(".")
    }

    // Execute after checkOperand. So, argument is forceUnwrap
    public func calc(leftOperand: String!, arithmetricOperation: String!, rightOperand: String!) -> String {
        var result: String?

        switch arithmetricOperation {
        case "+":
            result = String(self.plus(a: Float(leftOperand), b: Float(rightOperand)))
        case "-":
            result = String(self.minus(a: Float(leftOperand), b: Float(rightOperand)))
        case "×":
            result = String(format: "%.10f", self.multiply(a: Float(leftOperand), b: Float(rightOperand)))
        case "÷":
            result = String(self.divide(a: Float(leftOperand), b: Float(rightOperand)))
        default: break
        }

        guard let res: String = result else { return "" }
        if self.canConvertInt(str: res) {
            return String(Int(Float(res)!))
        }
        return res
    }

    public func checkOperand(leftOperand: String?, arithmetricOperation: String?, rightOperand: String?) -> Bool {
        if self.isStrExist(str: leftOperand) &&
            self.isStrExist(str: arithmetricOperation) &&
            self.isStrExist(str: rightOperand) {
            return true
        }
        return false
    }

    public func isStrExist(str: String?) -> Bool {
        guard let str: String = str else { return false }
        if str.characters.count == 0 {
            return false
        }
        return true
    }

    // Check str's end is .0
    public func canConvertInt(str: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: ".0")
        let matches: Array = regex.matches(in: str, options: [], range: NSRange(location: str.characters.count - 2, length: 2))
        if matches.count == 0 {
            return false
        }
        return true
    }
}
