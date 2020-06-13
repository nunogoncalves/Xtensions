//
//  UIView
//  XTensions
//
//  Created by Nuno Gonçalves on 13/06/2020.
//  Copyright © 2020 numicago. All rights reserved.
//

#if canImport(UIKit)

import UIKit

public protocol Reusable {
    static var identifier: String { get }
}

extension Reusable {
    public static var identifier: String { String(describing: type(of: Self.self)) }
}

public extension UICollectionView {

    func register<T>(_ T: T.Type) where T: UICollectionViewCell {
        register(T.self, forCellWithReuseIdentifier: T.identifier)
    }

    func dequeueCell<T>(for indexPath: IndexPath) -> T where T: Reusable {
        dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
     }
}

public extension UITableView {

    func register<T>(_ T: T.Type) where T: UITableViewCell {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }

    func dequeueCell<T>(for indexPath: IndexPath) -> T where T: Reusable {
        dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}

extension UICollectionViewCell: Reusable {}
extension UITableViewCell: Reusable {}

#endif
