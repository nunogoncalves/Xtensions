//
//  CGRect.swift
//  XtensionsTests
//
//  Created by Nuno Gonçalves on 13/06/2019.
//  Copyright © 2019 Nuno Gonçalves. All rights reserved.
//

import CoreGraphics

extension CGRect: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Float) {
        self.init(origin: .zero, size: CGSize(width: CGFloat(value), height: CGFloat(value)))
    }
}

extension CGRect: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self.init(origin: .zero, size: CGSize(width: CGFloat(value), height: CGFloat(value)))
    }
}
