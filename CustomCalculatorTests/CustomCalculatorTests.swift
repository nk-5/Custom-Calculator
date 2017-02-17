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
}
