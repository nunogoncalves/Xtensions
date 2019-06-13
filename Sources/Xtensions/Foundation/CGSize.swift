//
//  CGSize.swift
//  XtensionsTests
//
//  Created by Nuno Gonçalves on 13/06/2019.
//  Copyright © 2019 Nuno Gonçalves. All rights reserved.
//

import CoreGraphics

extension CGSize: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Float) {
        self.init(width: CGFloat(value), height: CGFloat(value))
    }
}

extension CGSize: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self.init(width: CGFloat(value), height: CGFloat(value))
    }
}
