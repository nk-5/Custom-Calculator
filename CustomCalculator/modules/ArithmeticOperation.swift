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
    public func plus(a: Float, b: Float) -> Float {
        return a + b
    }

    public func minus(a: Float, b: Float) -> Float {
        return a - b
    }

    public func multiply(a: Float, b: Float) -> Float {
        return a * b
    }

    public func divide(a: Float, b: Float) -> Float {
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

    public func hasStrContainPoint(str: String) -> Bool {
        return str.contains(".")
    }
}
