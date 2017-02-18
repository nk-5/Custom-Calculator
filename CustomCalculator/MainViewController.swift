//
//  MainViewController.swift
//  CustomCalculator
//
//  Created by 中川 慶悟 on 2017/02/16.
//  Copyright © 2017年 Keigo Nakagawa. All rights reserved.
//

import UIKit
import SwiftyButton

class MainViewController: UIViewController {
    @IBOutlet weak var result: UILabel!
    var tmp: String?
    var hasArithmetic: Bool = false

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

    private func connectNum(num: String) {
        if self.result.text == "0" {
            self.result.text = ""
        }

        if !hasArithmetic {
            self.result.text = self.result.text! + num
        }
    }
}
