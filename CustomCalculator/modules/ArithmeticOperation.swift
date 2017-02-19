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

    public func stackAdd(stack: Array<String>, str: String) -> Array<String> {
        var stack: [String] = stack

        // This scope in "" <- num
        if stack.isEmpty && self.isNumeric(str: str) {
            stack.append(str)
            return stack
        }

        // This scode in 1 <- arithmetric
        if isNumeric(str: stack[stack.endIndex - 1]) && self.isArithmetric(str: str) {
            stack.append(str)
            return stack
        }

        // This scope in 1 + <- num
        if isArithmetric(str: stack[stack.endIndex - 1]) && self.isNumeric(str: str) {
            stack.append(str)
            return stack
        }

        // This scope in 1 + <- arithmetric
        if isArithmetric(str: stack[stack.endIndex - 1]) && self.isArithmetric(str: str) {
            stack.remove(at: stack.endIndex - 1)
            stack.append(str)
            return stack
        }

        // This scope in 1 <- num or 1 + 1 <- num
        stack[stack.endIndex - 1] = stack[stack.endIndex - 1] + str
        return stack
    }

    public func stackRemove(stack: Array<String>) -> Array<String> {
        var stack: [String] = stack

        if stack.isEmpty {
            return stack
        }

        stack.remove(at: stack.endIndex - 1)
        return stack
    }

    public func isNumeric(str: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "[0-9]")
        let matches: Array = regex.matches(in: str, options: [], range: NSRange(location: 0, length: 1))
        if matches.count == 0 {
            return false
        }
        return true
    }

    public func isArithmetric(str: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "[+|\\-|×|÷]")
        let matches: Array = regex.matches(in: str, options: [], range: NSRange(location: 0, length: 1))
        if matches.count == 0 {
            return false
        }
        return true
    }
}
