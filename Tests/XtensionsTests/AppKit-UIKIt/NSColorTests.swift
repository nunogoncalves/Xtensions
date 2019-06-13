//
//  NSColorTests.swift
//  XtensionsTests
//
//  Created by Nuno Gonçalves on 10/06/2019.
//  Copyright © 2019 Nuno Gonçalves. All rights reserved.
//

import XCTest
@testable import Xtensions

#if canImport(AppKit)
    import AppKit

    final class NSColorTests: XCTestCase {

        func testCommonInit() {

            let white = CIColor(color: .white)!
            let whiteHex = CIColor(color: NSColor(hex: 0xFFFFFF))!

            let red = white.red
            let green = white.green
            let blue = white.blue
            let alpha = white.alpha

            let redHex = whiteHex.red
            let greenHex = whiteHex.green
            let blueHex = whiteHex.blue
            let alphaHex = whiteHex.alpha

            XCTAssertEqual(red, redHex)
            XCTAssertEqual(green, greenHex)
            XCTAssertEqual(blue, blueHex)
            XCTAssertEqual(alpha, alphaHex)
        }

        static var allTests = [
            ("testCommonInit", testCommonInit),
        ]
    }
#endif
