//
//  CollectionTests.swift
//  XtensionsTests
//
//  Created by Nuno Gonçalves on 10/06/2019.
//  Copyright © 2019 Nuno Gonçalves. All rights reserved.
//

import XCTest
@testable import Xtensions

final class CollectionTests: XCTestCase {

    struct Person { let name: String; let age: Int }

    let people = [
        Person(name: "Katrina", age: 35),
        Person(name: "Alice", age: 0),
        Person(name: "Nuno", age: 34),
        Person(name: "Bianca", age: 3),
    ]

    func testKeyPath() {

        XCTAssertEqual(people[\.name], ["Katrina", "Alice", "Nuno", "Bianca"])
    }

    func testSortedByKeyPath() {
        let sortedByAgeDecreasing = people.sorted(by: \.age, >)[\.name]
        XCTAssertEqual(sortedByAgeDecreasing, ["Katrina", "Nuno", "Bianca", "Alice"])

        let sortedByAgeIncreasing = people.sorted(by: \.age)[\.name]
        XCTAssertEqual(sortedByAgeIncreasing, ["Alice", "Bianca", "Nuno", "Katrina"])

        let sortedByName = people.sorted(by: \.name)[\.name]
        XCTAssertEqual(sortedByName, ["Alice", "Bianca", "Katrina", "Nuno"])
    }

    static var allTests = [
        ("testKeyPath", testKeyPath),
        ("testSortedByKeyPath", testSortedByKeyPath)
    ]
}
