//
//  MainViewController.swift
//  CustomCalculator
//
//  Created by 中川 慶悟 on 2017/02/16.
//  Copyright © 2017年 Keigo Nakagawa. All rights reserved.
//

import UIKit
import SwiftyButton

enum ArithmeticOperator: String {
    case plus = "+"
    case minus = "-"
    case multiply = "×"
    case divide = "÷"
}

enum ArithmetricExpressionAction: String {
    case add
    case remove
}

struct Equal {
    var arithmetric: String?
    var tmp: String?
}

class MainViewController: UIViewController {
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var arithmetricExpression: UILabel!

    let aoModule = ArithmeticOperation.init()
    var equal = Equal.init()

    var tmp: String?
    var arithmeticStatus: String?
    var shouldCalcrate: Bool = false
    var isCalcrated: Bool = false

    var stack: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTouchZero(_: Any) {
        self.connectNum(num: "0")
    }

    @IBAction func didTouchOne(_: Any) {
        self.connectNum(num: "1")
    }

    @IBAction func didTouchTwo(_: Any) {
        self.connectNum(num: "2")
    }

    @IBAction func didTouchThree(_: Any) {
        self.connectNum(num: "3")
    }

    @IBAction func didTouchFour(_: Any) {
        self.connectNum(num: "4")
    }

    @IBAction func didTouchFive(_: Any) {
        self.connectNum(num: "5")
    }

    @IBAction func didTouchSix(_: Any) {
        self.connectNum(num: "6")
    }

    @IBAction func didTouchSeven(_: Any) {
        self.connectNum(num: "7")
    }

    @IBAction func didTouchEight(_: Any) {
        self.connectNum(num: "8")
    }

    @IBAction func didTouchNine(_: Any) {
        self.connectNum(num: "9")
    }

    @IBAction func didTouchPoint(_: Any) {
        self.connectPoint(point: ".")
    }

    @IBAction func didTouchPlus(_: Any) {
        self.setArithmeticOperator(arithmeticOperator: ArithmeticOperator.plus.rawValue)
    }

    @IBAction func didTouchMinus(_: Any) {
        self.setArithmeticOperator(arithmeticOperator: ArithmeticOperator.minus.rawValue)
    }

    @IBAction func didTouchMultiply(_: Any) {
        self.setArithmeticOperator(arithmeticOperator: ArithmeticOperator.multiply.rawValue)
    }

    @IBAction func didTouchDivide(_: Any) {
        self.setArithmeticOperator(arithmeticOperator: ArithmeticOperator.divide.rawValue)
    }

    @IBAction func didTouchEqual(_: Any) {
        self.calc()
    }

    @IBAction func didTouchTaxIn(_: Any) {
    }

    @IBAction func didTouchClear(_: Any) {
        self.clear()
    }

    @IBAction func didTouchAllClear(_: Any) {
        self.allClear()
    }

    private func connectNum(num: String) {
        if self.result.text == "0" {
            self.result.text = ""
        }
        if aoModule.isStrExist(str: self.arithmeticStatus) && !self.shouldCalcrate {
            self.tmp = self.result.text
            self.result.text = ""
            self.shouldCalcrate = true
        }
        self.result.text = self.result.text! + num
        self.manageArithmetricExpression(stack: self.stack, str: num, action: ArithmetricExpressionAction.add.rawValue)
    }

    private func connectPoint(point: String) {
        if self.aoModule.hasStrContainPoint(str: self.result.text) {
            self.result.text = self.result.text! + point
        }
    }

    private func setArithmeticOperator(arithmeticOperator: String) {
        if self.aoModule.checkOperand(leftOperand: self.tmp,
                                      arithmetricOperation: self.arithmeticStatus,
                                      rightOperand: self.result.text) && self.shouldCalcrate {
            self.result.text = self.aoModule.calc(leftOperand: self.tmp,
                                                  arithmetricOperation: self.arithmeticStatus,
                                                  rightOperand: self.result.text)
            self.arithmeticStatus = arithmeticOperator
            self.tmp = ""
            self.shouldCalcrate = false
        } else {
            self.arithmeticStatus = arithmeticOperator
            self.isCalcrated = false
        }
        self.manageArithmetricExpression(stack: self.stack, str: arithmeticOperator, action: ArithmetricExpressionAction.add.rawValue)
    }

    private func calc() {
        if !self.isCalcrated {
            if self.aoModule.checkOperand(leftOperand: self.tmp,
                                          arithmetricOperation: self.arithmeticStatus,
                                          rightOperand: self.result.text) && self.shouldCalcrate {

                equal.tmp = self.result.text
                equal.arithmetric = self.arithmeticStatus
                self.result.text = self.aoModule.calc(leftOperand: self.tmp,
                                                      arithmetricOperation: self.arithmeticStatus,
                                                      rightOperand: self.result.text)
                self.isCalcrated = true
                self.arithmeticStatus = ""
                self.tmp = ""
                self.shouldCalcrate = false
            }
        } else {
            if self.aoModule.checkOperand(leftOperand: equal.tmp,
                                          arithmetricOperation: equal.arithmetric,
                                          rightOperand: self.result.text) {
                self.result.text = self.aoModule.calc(leftOperand: self.result.text,
                                                      arithmetricOperation: equal.arithmetric,
                                                      rightOperand: equal.tmp)
            }
        }
    }

    private func allClear() {
        self.tmp = ""
        self.arithmeticStatus = ""
        self.result.text = "0"
    }

    private func clear() {
        var cleared: Bool = false
        if self.aoModule.isStrExist(str: self.result.text) {
            self.result.text = "0"
            cleared = true
        }
        if !cleared && self.aoModule.isStrExist(str: self.arithmeticStatus) {
            self.arithmeticStatus = ""
            cleared = true
        }
        if !cleared && self.aoModule.isStrExist(str: self.tmp) {
            self.tmp = ""
        }
    }

    private func manageArithmetricExpression(stack: Array<String>, str: String, action: String) {
        if action == ArithmetricExpressionAction.add.rawValue {
            self.stack = aoModule.stackAdd(stack: stack, str: str)
        } else {
            self.stack = aoModule.stackRemove(stack: stack)
        }
        self.arithmetricExpression.text = aoModule.stackCombine(stack: stack)
    }
}
