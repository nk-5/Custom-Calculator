//
//  CustomCalculatorTests.swift
//  CustomCalculatorTests
//
//  Created by 中川 慶悟 on 2017/02/16.
//  Copyright © 2017年 Keigo Nakagawa. All rights reserved.
//

import XCTest
@testable import CustomCalculator

class CustomCalculatorTests: XCTestCase {

    let ao = ArithmeticOperation.init()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testPlus() {
        XCTAssertEqual(2, ao.plus(a: 1, b: 1))
        XCTAssertEqual(3, ao.plus(a: 1.5, b: 1.5))
        XCTAssertEqual(0, ao.plus(a: 0, b: 0))
        XCTAssertNotEqual(2, ao.plus(a: 1.5, b: 1))
    }

    func testMinus() {
        XCTAssertEqual(1, ao.minus(a: 2, b: 1))
        XCTAssertEqual(0, ao.minus(a: 1.5, b: 1.5))
        XCTAssertEqual(0, ao.minus(a: 0, b: 0))
        XCTAssertEqual(-1, ao.minus(a: 1, b: 2))
        XCTAssertNotEqual(0, ao.minus(a: 1.5, b: 1))
    }

    func testMultiply() {
        XCTAssertEqual(4, ao.multiply(a: 2, b: 2))
        XCTAssertEqual(2.25, ao.multiply(a: 1.5, b: 1.5))
        XCTAssertEqual(0, ao.multiply(a: 0, b: 0))
        XCTAssertEqual(-2, ao.multiply(a: -1, b: 2))
        XCTAssertNotEqual(1, ao.multiply(a: 1.5, b: 1))
    }

    func testDivide() {
        XCTAssertEqual(2, ao.divide(a: 4, b: 2))
        XCTAssertEqual(1, ao.divide(a: 1.5, b: 1.5))
        XCTAssertEqual(0, ao.divide(a: 0, b: 4))
        XCTAssertEqual(-0.5, ao.divide(a: -1, b: 2))
        XCTAssertNotEqual(0, ao.divide(a: 4, b: 0))
    }

    func testTaxIn() {
        XCTAssertEqual(1, ao.taxIn(a: 1))
        XCTAssertEqual(108.0, ao.taxIn(a: 100))
        XCTAssertEqual(0, ao.taxIn(a: 0))
        XCTAssertEqual(-108.0, ao.taxIn(a: -100.0))
        XCTAssertNotEqual(0, ao.taxIn(a: 100))
        XCTAssertNotEqual(1.08, ao.taxIn(a: 1))
    }

    func testHasStrContainPoint() {
        XCTAssertTrue(ao.hasStrContainPoint(str: "te.st"))
        XCTAssertFalse(ao.hasStrContainPoint(str: "test"))
    }

    func testCalc() {
        XCTAssertEqual("2", ao.calc(leftOperand: "1", arithmetricOperation: "+", rightOperand: "1"))
        XCTAssertEqual("0", ao.calc(leftOperand: "1", arithmetricOperation: "-", rightOperand: "1"))
        XCTAssertEqual("1", ao.calc(leftOperand: "1", arithmetricOperation: "×", rightOperand: "1"))
        XCTAssertEqual("1", ao.calc(leftOperand: "2", arithmetricOperation: "÷", rightOperand: "2"))
    }

    func testCheckOperand() {
        XCTAssertTrue(ao.checkOperand(leftOperand: "left", arithmetricOperation: "+", rightOperand: "right"))
        XCTAssertFalse(ao.checkOperand(leftOperand: "", arithmetricOperation: "+", rightOperand: "right"))
        XCTAssertFalse(ao.checkOperand(leftOperand: "left", arithmetricOperation: "", rightOperand: "right"))
        XCTAssertFalse(ao.checkOperand(leftOperand: "left", arithmetricOperation: "+", rightOperand: ""))
    }

    func testisStrExist() {
        XCTAssertTrue(ao.isStrExist(str: "test"))
        XCTAssertFalse(ao.isStrExist(str: ""))
    }

    func testCanConvertInt() {
        XCTAssertTrue(ao.canConvertInt(str: "1.0"))
        XCTAssertTrue(ao.canConvertInt(str: "100.0"))
        XCTAssertFalse(ao.canConvertInt(str: "0.012"))
    }

    func testStackAdd() {
        XCTAssertEqual(["1"], ao.stackAdd(stack: [], str: "1"))
        XCTAssertEqual(["12"], ao.stackAdd(stack: ["1"], str: "2"))
        XCTAssertEqual(["1", "+"], ao.stackAdd(stack: ["1"], str: "+"))
        XCTAssertEqual(["1", "-"], ao.stackAdd(stack: ["1", "+"], str: "-"))
        XCTAssertEqual(["1", "+", "2"], ao.stackAdd(stack: ["1", "+"], str: "2"))
        XCTAssertEqual(["1", "+", "23"], ao.stackAdd(stack: ["1", "+", "2"], str: "3"))
    }

    func testStackRemove() {
        XCTAssertEqual([], ao.stackRemove(stack: []))
        XCTAssertEqual([], ao.stackRemove(stack: ["1"]))
        XCTAssertEqual(["1"], ao.stackRemove(stack: ["1", "+"]))
    }

    func testIsNumeric() {
        XCTAssertTrue(ao.isNumeric(str: "1"))
        XCTAssertFalse(ao.isNumeric(str: "test"))
    }

    func testIsArithmetric() {
        XCTAssertTrue(ao.isArithmetric(str: "+"))
        XCTAssertTrue(ao.isArithmetric(str: "-"))
        XCTAssertTrue(ao.isArithmetric(str: "×"))
        XCTAssertTrue(ao.isArithmetric(str: "÷"))
        XCTAssertFalse(ao.isArithmetric(str: "test"))
    }
}
