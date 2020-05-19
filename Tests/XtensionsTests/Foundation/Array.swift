//
//  CGRectTests.swift
//  XtensionsTests
//
//  Created by Nuno Gonçalves on 19/05/2020.
//  Copyright © 2019 Nuno Gonçalves. All rights reserved.
//

import XCTest

final class ArrayTests: XCTestCase {

    func testSafe() {
        let array = [1, 2, 3]
        XCTAssertNil(array[safe: -1])
        XCTAssertEqual(array[safe: 0], 1)
        XCTAssertEqual(array[safe: 1], 2)
        XCTAssertEqual(array[safe: 2], 3)
        XCTAssertNil(array[safe: 3])
    }
}
