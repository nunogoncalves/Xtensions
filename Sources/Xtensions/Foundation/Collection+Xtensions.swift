//
//  Collection+Xtensions.swift
//  Xtensions
//
//  Created by Nuno Gonçalves on 10/06/2019.
//  Copyright © 2019 Nuno Gonçalves. All rights reserved.
//

import Foundation

public extension Collection {
    subscript<T>(_ keypath: KeyPath<Element, T>) -> [T] {
        return map { $0[keyPath: keypath] }
    }

    func sorted<T: Comparable>(
        by value: KeyPath<Element, T>,
        _ comparison: (T, T) -> Bool = { $0 <= $1 }
    ) -> Array<Element> {
        return sorted { comparison($0[keyPath: value], $1[keyPath: value]) }
    }
}
