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
        switch arithmetricOperation {
        case "+":
            return String(self.plus(a: Float(leftOperand), b: Float(rightOperand)))
        case "-":
            return String(self.minus(a: Float(leftOperand), b: Float(rightOperand)))
        case "×":
            return String(self.multiply(a: Float(leftOperand), b: Float(rightOperand)))
        case "÷":
            return String(self.divide(a: Float(leftOperand), b: Float(rightOperand)))
        default: break
        }
        return ""
    }

    public func checkOperand(leftOperand: String?, arithmetricOperation: String?, rightOperand: String?) -> Bool {
        if self.checkStrLength(str: leftOperand) &&
            self.checkStrLength(str: arithmetricOperation) &&
            self.checkStrLength(str: rightOperand) {
            return true
        }
        return false
    }

    public func checkStrLength(str: String?) -> Bool {
        guard let str: String = str else {
            return false
        }
        if str.characters.count == 0 {
            return false
        }
        return true
    }
}
