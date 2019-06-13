//
//  CollectionTests.swift
//  XtensionsTests
//
//  Created by Nuno Gonçalves on 10/06/2019.
//  Copyright © 2016 Nuno Gonçalves. All rights reserved.
//

import XCTest
@testable import Xtensions

final class CollectionTests: XCTestCase {

    struct Person { let name: String }

    func testKeyPath() {

        let people = [
            Person(name: "Nuno"),
            Person(name: "Katrina"),
            Person(name: "Bianca"),
            Person(name: "Alice")
        ]

        XCTAssertEqual(people[\.name], ["Nuno", "Katrina", "Bianca", "Alice"])
    }

    static var allTests = [
        ("testKeyPath", testKeyPath),
    ]
}
