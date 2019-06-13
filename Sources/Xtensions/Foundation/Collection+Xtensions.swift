//
//  Collection+Xtensions.swift
//  Xtensions
//
//  Created by Nuno Gonçalves on 10/06/2019.
//  Copyright © 2016 Nuno Gonçalves. All rights reserved.
//

import Foundation

public extension Collection {
    subscript<T>(_ keypath: KeyPath<Element, T>) -> [T] {
        return map { $0[keyPath: keypath] }
    }
}
