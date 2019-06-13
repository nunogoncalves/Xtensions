//
//  EdgeInsets.swift
//  Xtensions
//
//  Created by Nuno Gonçalves on 10/06/2019.
//  Copyright © 2019 Nuno Gonçalves. All rights reserved.
//

#if canImport(UIKit)
import UIKit
typealias EdgeInsets = UIEdgeInsets
#endif

#if canImport(AppKit)
import AppKit
typealias EdgeInsets = NSEdgeInsets
#endif

extension EdgeInsets: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self.init(all: CGFloat(value))
    }
}

public extension EdgeInsets {

    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }

    init(horizontal: CGFloat) {
        self.init(top: 0, left: horizontal, bottom: 0, right: horizontal)
    }

    init(vertical: CGFloat) {
        self.init(top: vertical, left: 0, bottom: vertical, right: 0)
    }

    init(all margin: CGFloat) {
        self.init(top: margin, left: margin, bottom: margin, right: margin)
    }

    init(allButTop margin: CGFloat) {
        self.init(top: 0, left: margin, bottom: margin, right: margin)
    }

    init(allButLeft margin: CGFloat) {
        self.init(top: margin, left: 0, bottom: margin, right: margin)
    }

    init(allButBottom margin: CGFloat) {
        self.init(top: margin, left: margin, bottom: 0, right: margin)
    }

    init(allButRight margin: CGFloat) {
        self.init(top: margin, left: margin, bottom: margin, right: 0)
    }

    init(top: CGFloat) {
        self.init(top: top, left: 0, bottom: 0, right: 0)
    }

    init(left: CGFloat) {
        self.init(top: 0, left: left, bottom: 0, right: 0)
    }

    init(bottom: CGFloat) {
        self.init(top: 0, left: 0, bottom: bottom, right: 0)
    }

    init(right: CGFloat) {
        self.init(top: 0, left: 0, bottom: 0, right: right)
    }
}
