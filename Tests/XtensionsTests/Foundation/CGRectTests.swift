//
//  CGRectTests.swift
//  XtensionsTests
//
//  Created by Nuno Gonçalves on 13/06/2019.
//  Copyright © 2019 Nuno Gonçalves. All rights reserved.
//

import XCTest
@testable import Xtensions

final class CGRectTests: XCTestCase {

    func testWithFloatLiteral() {
        let rect: CGRect = 10.0
        XCTAssertEqual(rect, CGRect(origin: .zero, size: CGSize(width: 10, height: 10)))
    }

    func testWithIntLiteral() {
        let rect: CGRect = 10
        XCTAssertEqual(rect, CGRect(origin: .zero, size: CGSize(width: 10, height: 10)))
    }

    static var allTests = [
        ("testWithFloatLiteral", testWithFloatLiteral),
        ("testWithIntLiteral", testWithIntLiteral),
    ]
}
