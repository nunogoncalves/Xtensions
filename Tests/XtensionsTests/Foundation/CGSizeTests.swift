//
//  CGSizeTests.swift
//  XtensionsTests
//
//  Created by Nuno Gonçalves on 13/06/2019.
//  Copyright © 2019 Nuno Gonçalves. All rights reserved.
//

import XCTest
@testable import Xtensions

final class CGSizeTests: XCTestCase {

    func testWithFloatLiteral() {
        let size: CGSize = 10.0
        XCTAssertEqual(size, CGSize(width: 10, height: 10))
    }

    func testWithIntLiteral() {
        let size: CGSize = 10
        XCTAssertEqual(size, CGSize(width: 10, height: 10))
    }

    static var allTests = [
        ("testWithFloatLiteral", testWithFloatLiteral),
        ("testWithIntLiteral", testWithIntLiteral),
    ]
}
