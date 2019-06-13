//
//  UIColorTests.swift
//  XtensionsTests
//
//  Created by Nuno Gonçalves on 10/06/2019.
//  Copyright © 2019 Nuno Gonçalves. All rights reserved.
//

import XCTest
@testable import Xtensions

#if canImport(UIKit)
import UIKit

final class AppColorTests: XCTestCase {

    func testCommonInit() {
        let white = UIColor.white
        let whiteHex = UIColor(hex: 0xFFFFFF)

        var whiteRed: CGFloat = -1
        var whiteGreen: CGFloat = -1
        var whiteBlue: CGFloat = -1
        var whiteAlpha: CGFloat = -1

        var whiteRedHex: CGFloat = -2
        var whiteGreenHex: CGFloat = -2
        var whiteBlueHex: CGFloat = -2
        var whiteAlphaHex: CGFloat = -2

        white.getRed(&whiteRed, green: &whiteGreen, blue: &whiteBlue, alpha: &whiteAlpha)
        whiteHex.getRed(&whiteRedHex, green: &whiteGreenHex, blue: &whiteBlueHex, alpha: &whiteAlphaHex)

        XCTAssertEqual(whiteRed, whiteRedHex)
        XCTAssertEqual(whiteGreen, whiteGreenHex)
        XCTAssertEqual(whiteBlue, whiteBlueHex)
        XCTAssertEqual(whiteAlpha, whiteAlphaHex)
    }

    static var allTests = [
        ("testKeyPath", testCommonInit),
    ]
}
#endif
