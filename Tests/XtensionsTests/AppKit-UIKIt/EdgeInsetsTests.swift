//
//  AppColorTests.swift
//  XtensionsTests
//
//  Created by Nuno Gonçalves on 13/06/2019.
//  Copyright © 2019 Nuno Gonçalves. All rights reserved.
//

import XCTest
@testable import Xtensions

final class EdgeInsetsTests: XCTestCase {

    func testAllCustomInits() {

        let insetsHorVer = EdgeInsets(horizontal: 5, vertical: 4)
        XCTAssertTrue(insetsHorVer.top == 4)
        XCTAssertTrue(insetsHorVer.left == 5)
        XCTAssertTrue(insetsHorVer.bottom == 4)
        XCTAssertTrue(insetsHorVer.right == 5)

        let insetsHorizontal = EdgeInsets(horizontal: 3)
        XCTAssertTrue(insetsHorizontal.top == 0)
        XCTAssertTrue(insetsHorizontal.left == 3)
        XCTAssertTrue(insetsHorizontal.bottom == 0)
        XCTAssertTrue(insetsHorizontal.right == 3)

        let insetsVertical = EdgeInsets(vertical: 2)
        XCTAssertTrue(insetsVertical.top == 2)
        XCTAssertTrue(insetsVertical.left == 0)
        XCTAssertTrue(insetsVertical.bottom == 2)
        XCTAssertTrue(insetsVertical.right == 0)

        let insetsAll = EdgeInsets(all: 21)
        XCTAssertTrue(insetsAll.top == 21)
        XCTAssertTrue(insetsAll.left == 21)
        XCTAssertTrue(insetsAll.bottom == 21)
        XCTAssertTrue(insetsAll.right == 21)

        let insetsNoTop = EdgeInsets(allButTop: 51)
        XCTAssertTrue(insetsNoTop.top == 0)
        XCTAssertTrue(insetsNoTop.left == 51)
        XCTAssertTrue(insetsNoTop.bottom == 51)
        XCTAssertTrue(insetsNoTop.right == 51)

        let insetsNoLeft = EdgeInsets(allButLeft: 52)
        XCTAssertTrue(insetsNoLeft.top == 52)
        XCTAssertTrue(insetsNoLeft.left == 0)
        XCTAssertTrue(insetsNoLeft.bottom == 52)
        XCTAssertTrue(insetsNoLeft.right == 52)

        let insetsNoBottom = EdgeInsets(allButBottom: 25)
        XCTAssertTrue(insetsNoBottom.top == 25)
        XCTAssertTrue(insetsNoBottom.left == 25)
        XCTAssertTrue(insetsNoBottom.bottom == 0)
        XCTAssertTrue(insetsNoBottom.right == 25)

        let insetsNoRight = EdgeInsets(allButRight: 15)
        XCTAssertTrue(insetsNoRight.top == 15)
        XCTAssertTrue(insetsNoRight.left == 15)
        XCTAssertTrue(insetsNoRight.bottom == 15)
        XCTAssertTrue(insetsNoRight.right == 0)

        let insetsTop = EdgeInsets(top: 13)
        XCTAssertTrue(insetsTop.top == 13)
        XCTAssertTrue(insetsTop.left == 0)
        XCTAssertTrue(insetsTop.bottom == 0)
        XCTAssertTrue(insetsTop.right == 0)

        let insetsLeft = EdgeInsets(left: 6)
        XCTAssertTrue(insetsLeft.top == 0)
        XCTAssertTrue(insetsLeft.left == 6)
        XCTAssertTrue(insetsLeft.bottom == 0)
        XCTAssertTrue(insetsLeft.right == 0)

        let insetsBottom = EdgeInsets(bottom: 7)
        XCTAssertTrue(insetsBottom.top == 0)
        XCTAssertTrue(insetsBottom.left == 0)
        XCTAssertTrue(insetsBottom.bottom == 7)
        XCTAssertTrue(insetsBottom.right == 0)

        let insetsRight = EdgeInsets(right: 9)
        XCTAssertTrue(insetsRight.top == 0)
        XCTAssertTrue(insetsRight.left == 0)
        XCTAssertTrue(insetsRight.bottom == 0)
        XCTAssertTrue(insetsRight.right == 9)

        let insetsInteger: EdgeInsets = 27
        XCTAssertTrue(insetsInteger.top == 27)
        XCTAssertTrue(insetsInteger.left == 27)
        XCTAssertTrue(insetsInteger.bottom == 27)
        XCTAssertTrue(insetsInteger.right == 27)
    }

    static var allTests = [
        ("testAllCustomInits", testAllCustomInits),
    ]
}
