//
//  RxMainViewController.swift
//  CustomCalculator
//
//  Created by 中川 慶悟 on 2017/03/21.
//  Copyright © 2017年 Keigo Nakagawa. All rights reserved.
//

import UIKit
import SwiftyButton
#if !RX_NO_MODULE
    import RxSwift
    import RxCocoa
#endif

struct CalculatorState {
    static let CLEAR_STATE = CalculatorState(action: .clear)
    let action: Action
}

extension CalculatorState {
    func tranformState(_ x: Action) -> CalculatorState {
        switch x {
        case .addNumber(let c):
            return addNumber(c)
        default:
            return CalculatorState(action: action)
        }
    }
    
    func addNumber(_ char: Character) -> CalculatorState {
        return CalculatorState(action: action)
    }
}

enum Action {
    case clear
    case changeSign
    case percent
    case operation(Operator)
    case equal
    case addNumber(Character)
    case addDot
}

enum Operator {
    case addition
    case subtraction
    case multiplication
    case division
}

extension Operator {
    var sign: String {        switch self {
        case .addition:         return "+"
        case .subtraction:      return "-"
        case .multiplication:   return "×"
        case .division:         return "/"
        }
    }
    
    var perform: (Double, Double) -> Double {
        switch self {
        case .addition:         return (+)
        case .subtraction:      return (-)
        case .multiplication:   return (*)
        case .division:         return (/)
        }
    }
}

var disposeBag = DisposeBag()

class RxMainViewController: UIViewController {
    
    @IBOutlet weak var airthmetricExpression: UILabel!
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var allClear: UIButton!
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var tax: UIButton!
    
    @IBOutlet weak var divide: UIButton!
    @IBOutlet weak var multiply: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var equal: UIButton!
    
    @IBOutlet weak var dot: UIButton!
    

    @IBOutlet weak var zero: UIButton!

    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    
    
    override func viewDidLoad() {
//        super.viewDidLoad()
        let commands:[Observable<Action>] = [
            plus.rx.tap.map { _ in .operation(.addition) },
            one.rx.tap.map { _ in .addNumber("1") },
            two.rx.tap.map { _ in .addNumber("2") }
        ]
        
        Observable.from(commands)
            .merge()
            .scan(CalculatorState.CLEAR_STATE) { previous, action in
                return previous.tranformState(action)
            }
            .debug("RxSwift Test")
            .subscribe(onNext: { [weak self] calState in
                self?.result.text = "test"
            })
            .disposed(by: disposeBag)
//            .addDisposableTo(DisposeBag())
    }

}
