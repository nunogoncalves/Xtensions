//
//  DateFormatterTests.swift
//  XtensionsTests
//
//  Created by Nuno Gonçalves on 21/03/2020.
//  Copyright © 2020 Nuno Gonçalves. All rights reserved.
//

import XCTest
@testable import Xtensions

final class DateFormatterTests: XCTestCase {

    func testInitWithFormat() {

        let formatter = DateFormatter(format: "YYYY-MM-dd HH:mm:ss")
        let date = formatter.date(from: "2020-03-22 12:00:00")

        let dateComponents = DateComponents(
            calendar: Calendar.current,
            year: 2020,
            month: 3,
            day: 22,
            hour: 12,
            minute: 00,
            second: 00
        )

        let expectedDate = dateComponents.date

        XCTAssertEqual(expectedDate, date)
    }
}
