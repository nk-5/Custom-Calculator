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

class MainViewController: UIViewController {
    @IBOutlet weak var result: UILabel!

    let aoModule = ArithmeticOperation.init()
    var tmp: String?
    var arithmeticStatus: String?
    var shouldCalcrate: Bool = false

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
    }

    private func connectPoint(point: String) {
        if self.aoModule.hasStrContainPoint(str: self.result.text) {
            self.result.text = self.result.text! + point
        }
    }

    private func setArithmeticOperator(arithmeticOperator: String) {
        if self.aoModule.checkOperand(leftOperand: self.tmp,
                                      arithmetricOperation: self.arithmeticStatus,
                                      rightOperand: self.result.text) {
            self.result.text = self.aoModule.calc(leftOperand: self.tmp,
                                                  arithmetricOperation: self.arithmeticStatus,
                                                  rightOperand: self.result.text)
            self.arithmeticStatus = arithmeticOperator
            self.tmp = ""
            self.shouldCalcrate = false
        } else {
            self.arithmeticStatus = arithmeticOperator
        }
    }
}
