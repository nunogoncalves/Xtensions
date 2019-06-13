//
//  Color.swift
//  Xtensions
//
//  Created by Nuno Gonçalves on 10/06/2019.
//  Copyright © 2016 Nuno Gonçalves. All rights reserved.
//

#if canImport(UIKit)
import UIKit
typealias Color = UIColor
#endif

#if canImport(AppKit)
import AppKit
typealias Color = NSColor
#endif

extension Color {

    convenience init(hex: UInt, alpha: CGFloat = 1.0) {

        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue:  CGFloat(hex & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
