//
//  NSView
//  XTensions
//
//  Created by Nuno Gonçalves on 27/03/2019.
//  Copyright © 2019 numicago. All rights reserved.
//

#if canImport(AppKit)

import AppKit

public func create<T: NSView>(usingAutoLayout: Bool = true, configure: (T) -> Void = { _ in }) -> T {
    let object = T()
    object.translatesAutoresizingMaskIntoConstraints = !usingAutoLayout
    configure(object)
    return object
}

public extension NSView {

    func addSubNSViews(_ NSViews: NSView...) {
        NSViews.forEach { addSubview($0) }
    }

    func addSubNSViews(_ NSViews: [NSView]) {
        NSViews.forEach { addSubview($0) }
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
        of NSView: NSView,
        topConstant: CGFloat = 0,
        leadingConstant: CGFloat = 0,
        bottomConstant: CGFloat = 0,
        trailingConstant: CGFloat = 0
    ) {

        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: NSView.topAnchor, constant: topConstant),
            leadingAnchor.constraint(equalTo: NSView.leadingAnchor, constant: leadingConstant),
            bottomAnchor.constraint(equalTo: NSView.bottomAnchor, constant: bottomConstant),
            trailingAnchor.constraint(equalTo: NSView.trailingAnchor, constant: trailingConstant)
        ])
    }

    func pinToBounds(of NSView: NSView, margins margin: CGFloat) {
        pinToBounds(
            of: NSView,
            topConstant: margin,
            leadingConstant: margin,
            bottomConstant: -margin,
            trailingConstant: -margin
        )
    }


    func pinTo(
        marginsGuide guide: NSLayoutGuide,
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

    func constrain(referringTo NSView: NSView, all: CGFloat) {
        constrain(referringTo: NSView, top: all, leading: all, bottom: -all, trailing: -all)
    }

    func constrain(
        referringTo NSView: NSView,
        top: CGFloat? = 0,
        leading: CGFloat? = 0,
        bottom: CGFloat? = 0,
        trailing: CGFloat? = 0
    ) {

        var constraintsToActivate: [NSLayoutConstraint] = []

        if let topConstant = top {
            constraintsToActivate.append(
                topAnchor.constraint(equalTo: NSView.topAnchor, constant: topConstant)
            )
        }

        if let leadingConstant = leading {
            constraintsToActivate.append(
                leadingAnchor.constraint(equalTo: NSView.leadingAnchor, constant: leadingConstant)
            )
        }

        if let bottomConstant = bottom {
            constraintsToActivate.append(
                bottomAnchor.constraint(equalTo: NSView.bottomAnchor, constant: bottomConstant)
            )
        }

        if let trailingConstant = trailing {
            constraintsToActivate.append(
                trailingAnchor.constraint(equalTo: NSView.trailingAnchor, constant: trailingConstant)
            )
        }

        NSLayoutConstraint.activate(constraintsToActivate)
    }

    func constrain(
        referringTo guide: NSLayoutGuide,
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
        _ NSView: NSView,
        _ constant: CGFloat = 0
    ) -> NSLayoutConstraint {
        return anchor(topAnchor, equality, NSView.topAnchor, constant)
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
        _ NSView: NSView,
        _ constant: CGFloat = 0
    ) -> NSLayoutConstraint {
        return anchor(bottomAnchor, equality, NSView.bottomAnchor, constant)
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
        _ NSView: NSView,
        _ constant: CGFloat = 0
    ) -> NSLayoutConstraint {
        return anchor(leadingAnchor, equality, NSView.leadingAnchor, constant)
    }

    @discardableResult
    func trailing(
        _ equality: (Int, Int) -> (Bool),
        _ NSView: NSView,
        _ constant: CGFloat = 0
    ) -> NSLayoutConstraint {
        return anchor(trailingAnchor, equality, NSView.trailingAnchor, constant)
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
        _ NSView: NSView,
        _ constant: CGFloat = 0
    ) -> NSLayoutConstraint {
        return anchor(centerXAnchor, equality, NSView.centerXAnchor, constant)
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
        _ NSView: NSView,
        _ constant: CGFloat = 0
    ) -> NSLayoutConstraint {
        return anchor(centerYAnchor, equality, NSView.centerYAnchor, constant)
    }

    @discardableResult
    private func anchor<T>(
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

    func constrainSize(equalTo constant: CGFloat) {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }

    func constrain(width: CGFloat, height: CGFloat) {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: width),
            heightAnchor.constraint(equalToConstant: height)
        ])
    }

    func constrain(toCenterOf view: NSView) {
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func constrain(height: CGFloat) {
        return heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    func constrain(width: CGFloat) {
        return widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    func center(
        _ equality: (Int, Int) -> (Bool),
        _ view: NSView,
        _ constant: CGFloat = 0
    ) {
        anchor(centerYAnchor, equality, view.centerYAnchor, constant)
        anchor(centerXAnchor, equality, view.centerXAnchor, constant)
    }
}

#endif
