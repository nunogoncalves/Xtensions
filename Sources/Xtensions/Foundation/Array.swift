//
//  CGRect.swift
//  XtensionsTests
//
//  Created by Nuno Gonçalves on 19/05/2020.
//  Copyright © 2019 Nuno Gonçalves. All rights reserved.
//

import Foundation

public extension Array {

    subscript(safe index: Int) -> Element? {
        guard isEmpty == false else { return nil }
        if index >= 0 && index <= count - 1 {
            return self[index]
        }
        return nil
    }
}
