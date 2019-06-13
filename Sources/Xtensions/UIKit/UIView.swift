//
//  UIView
//  XTensions
//
//  Created by Nuno Gonçalves on 27/03/2019.
//  Copyright © 2019 numicago. All rights reserved.
//

#if canImport(UIKit)

    import UIKit

    public func create<T: UIView>(usingAutoLayout: Bool = true, configure: (T) -> Void = { _ in }) -> T {
        let object = T()
        object.translatesAutoresizingMaskIntoConstraints = !usingAutoLayout
        configure(object)
        return object
    }

    public extension UIView {

        func addSubUIViews(_ UIViews: UIView...) {
            UIViews.forEach { addSubview($0) }
        }

        func addSubUIViews(_ UIViews: [UIView]) {
            UIViews.forEach { addSubview($0) }
        }

        static func usingAutoLayout() -> Self {
            return create()
        }

        @discardableResult
        func usingAutoLayout() -> Self {
            translatesAutoresizingMaskIntoConstraints = false
            return self
        }

        func pinToBounds(
            of UIView: UIView,
            topConstant: CGFloat = 0,
            leadingConstant: CGFloat = 0,
            bottomConstant: CGFloat = 0,
            trailingConstant: CGFloat = 0
        ) {

            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: UIView.topAnchor, constant: topConstant),
                leadingAnchor.constraint(equalTo: UIView.leadingAnchor, constant: leadingConstant),
                bottomAnchor.constraint(equalTo: UIView.bottomAnchor, constant: bottomConstant),
                trailingAnchor.constraint(equalTo: UIView.trailingAnchor, constant: trailingConstant)
            ])
        }

        func pinToBounds(of UIView: UIView, margins margin: CGFloat) {
            pinToBounds(
                of: UIView,
                topConstant: margin,
                leadingConstant: margin,
                bottomConstant: -margin,
                trailingConstant: -margin
            )
        }


        func pinTo(
            marginsGuide guide: UILayoutGuide,
            topConstant: CGFloat = 0,
            leadingConstant: CGFloat = 0,
            bottomConstant: CGFloat = 0,
            trailingConstant: CGFloat = 0
        ) {

            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: guide.topAnchor, constant: topConstant),
                leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: leadingConstant),
                bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: bottomConstant),
                trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: trailingConstant)
            ])
        }

        func constrain(referringTo UIView: UIView, all: CGFloat) {
            constrain(referringTo: UIView, top: all, leading: all, bottom: -all, trailing: -all)
        }

        func constrain(
            referringTo UIView: UIView,
            top: CGFloat? = 0,
            leading: CGFloat? = 0,
            bottom: CGFloat? = 0,
            trailing: CGFloat? = 0
        ) {

            var constraintsToActivate: [NSLayoutConstraint] = []

            if let topConstant = top {
                constraintsToActivate.append(
                    topAnchor.constraint(equalTo: UIView.topAnchor, constant: topConstant)
                )
            }

            if let leadingConstant = leading {
                constraintsToActivate.append(
                    leadingAnchor.constraint(equalTo: UIView.leadingAnchor, constant: leadingConstant)
                )
            }

            if let bottomConstant = bottom {
                constraintsToActivate.append(
                    bottomAnchor.constraint(equalTo: UIView.bottomAnchor, constant: bottomConstant)
                )
            }

            if let trailingConstant = trailing {
                constraintsToActivate.append(
                    trailingAnchor.constraint(equalTo: UIView.trailingAnchor, constant: trailingConstant)
                )
            }

            NSLayoutConstraint.activate(constraintsToActivate)
        }

        func constrain(
            referringTo guide: UILayoutGuide,
            top: CGFloat? = 0,
            leading: CGFloat? = 0,
            bottom: CGFloat? = 0,
            trailing: CGFloat? = 0
        ) {

            var constraintsToActivate: [NSLayoutConstraint] = []

            if let topConstant = top {
                constraintsToActivate.append(
                    topAnchor.constraint(equalTo: guide.topAnchor, constant: topConstant)
                )
            }

            if let leadingConstant = leading {
                constraintsToActivate.append(
                    leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: leadingConstant)
                )
            }

            if let bottomConstant = bottom {
                constraintsToActivate.append(
                    bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: bottomConstant)
                )
            }

            if let trailingConstant = trailing {
                constraintsToActivate.append(
                    trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: trailingConstant)
                )
            }

            NSLayoutConstraint.activate(constraintsToActivate)
        }

        @discardableResult
        func top(
            _ equality: (Int, Int) -> (Bool),
            _ other: NSLayoutYAxisAnchor,
            _ constant: CGFloat = 0
        ) -> NSLayoutConstraint {
            return anchor(topAnchor, equality, other, constant)
        }

        @discardableResult
        func top(
            _ equality: (Int, Int) -> (Bool),
            _ UIView: UIView,
            _ constant: CGFloat = 0
        ) -> NSLayoutConstraint {
            return anchor(topAnchor, equality, UIView.topAnchor, constant)
        }

        @discardableResult
        func bottom(
            _ equality: (Int, Int) -> (Bool),
            _ other: NSLayoutYAxisAnchor,
            _ constant: CGFloat = 0
        ) -> NSLayoutConstraint {
            return anchor(bottomAnchor, equality, other, constant)
        }

        @discardableResult
        func bottom(
            _ equality: (Int, Int) -> (Bool),
            _ UIView: UIView,
            _ constant: CGFloat = 0
        ) -> NSLayoutConstraint {
            return anchor(bottomAnchor, equality, UIView.bottomAnchor, constant)
        }

        @discardableResult
        func leading(
            _ equality: (Int, Int) -> (Bool),
            _ other: NSLayoutXAxisAnchor,
            _ constant: CGFloat = 0
        ) -> NSLayoutConstraint {
            return anchor(leadingAnchor, equality, other, constant)
        }

        @discardableResult
        func leading(
            _ equality: (Int, Int) -> (Bool),
            _ UIView: UIView,
            _ constant: CGFloat = 0
        ) -> NSLayoutConstraint {
            return anchor(leadingAnchor, equality, UIView.leadingAnchor, constant)
        }

        @discardableResult
        func trailing(
            _ equality: (Int, Int) -> (Bool),
            _ UIView: UIView,
            _ constant: CGFloat = 0
        ) -> NSLayoutConstraint {
            return anchor(trailingAnchor, equality, UIView.trailingAnchor, constant)
        }

        @discardableResult
        func trailing(
            _ equality: (Int, Int) -> (Bool),
            _ other: NSLayoutXAxisAnchor,
            _ constant: CGFloat = 0
        ) -> NSLayoutConstraint {
            return anchor(trailingAnchor, equality, other, constant)
        }

        @discardableResult
        func centerX(
            _ equality: (Int, Int) -> (Bool),
            _ other: NSLayoutXAxisAnchor,
            _ constant: CGFloat = 0
        ) -> NSLayoutConstraint {
            return anchor(centerXAnchor, equality, other, constant)
        }

        @discardableResult
        func centerX(
            _ equality: (Int, Int) -> (Bool),
            _ UIView: UIView,
            _ constant: CGFloat = 0
            ) -> NSLayoutConstraint {
            return anchor(centerXAnchor, equality, UIView.centerXAnchor, constant)
        }

        @discardableResult
        func centerY(
            _ equality: (Int, Int) -> (Bool),
            _ other: NSLayoutYAxisAnchor,
            _ constant: CGFloat = 0
        ) -> NSLayoutConstraint {
            return anchor(centerYAnchor, equality, other, constant)
        }

        @discardableResult
        func centerY(
            _ equality: (Int, Int) -> (Bool),
            _ UIView: UIView,
            _ constant: CGFloat = 0
            ) -> NSLayoutConstraint {
            return anchor(centerYAnchor, equality, UIView.centerYAnchor, constant)
        }

        func anchor<T>(
            _ anchor: NSLayoutAnchor<T>,
            _ equality: (Int, Int) -> (Bool),
            _ anchor2: NSLayoutAnchor<T>,
            _ constant: CGFloat
        ) -> NSLayoutConstraint {

            let constraint: NSLayoutConstraint
            defer { constraint.isActive = true }

            switch (equality(1, 1), equality(2, 1), equality(1, 2)) {
            case (true, false, false):
                constraint = anchor.constraint(equalTo: anchor2, constant: constant)
            case (_, true, _):
                constraint = anchor.constraint(greaterThanOrEqualTo: anchor2, constant: constant)
            case (_, _, true):
                constraint = anchor.constraint(lessThanOrEqualTo: anchor2, constant: constant)
            default:
                constraint = anchor.constraint(equalTo: anchor2, constant: constant)
            }

            return constraint
        }

        static func set(_ dimension: NSLayoutDimension, _ constant: CGFloat) {
            dimension.constraint(equalToConstant: constant).isActive = true
        }
    }

#endif
