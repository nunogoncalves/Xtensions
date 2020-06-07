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

    func addSubNSViews(_ views: NSView...) {
        views.forEach { addSubview($0) }
    }

    func addSubNSViews(_ views: [NSView]) {
        views.forEach { addSubview($0) }
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
        of view: NSView,
        topConstant: CGFloat = 0,
        leadingConstant: CGFloat = 0,
        bottomConstant: CGFloat = 0,
        trailingConstant: CGFloat = 0
    ) {

        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor, constant: topConstant),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingConstant),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomConstant),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingConstant)
        ])
    }

    func pinToBounds(of view: NSView, margins margin: CGFloat) {
        pinToBounds(
            of: view,
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

    func constrain(referringTo view: NSView, all margin: CGFloat) {
        constrain(referringTo: view, top: margin, leading: margin, bottom: -margin, trailing: -margin)
    }

    func constrain(
        referringTo view: NSView,
        top: CGFloat? = 0,
        leading: CGFloat? = 0,
        bottom: CGFloat? = 0,
        trailing: CGFloat? = 0
    ) {
        constrainOnly(
            top: top ?? 0,
            leading: leading ?? 0,
            bottom: bottom ?? 0,
            trailing: trailing ?? 0,
            referringTo: view
        )
    }
    func constrainOnly(
        top: CGFloat? = nil,
        leading: CGFloat? = nil,
        bottom: CGFloat? = nil,
        trailing: CGFloat? = nil,
        referringTo view: NSView
    ) {

        var constraintsToActivate: [NSLayoutConstraint] = []

        if let topConstant = top {
            constraintsToActivate.append(
                topAnchor.constraint(equalTo: view.topAnchor, constant: topConstant)
            )
        }

        if let leadingConstant = leading {
            constraintsToActivate.append(
                leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingConstant)
            )
        }

        if let bottomConstant = bottom {
            constraintsToActivate.append(
                bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomConstant)
            )
        }

        if let trailingConstant = trailing {
            constraintsToActivate.append(
                trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingConstant)
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
        constrainOnly(
            top: top ?? 0,
            leading: leading ?? 0,
            bottom: bottom ?? 0,
            trailing: trailing ?? 0,
            referringTo: guide
        )
    }

    func constrainOnly(
        top: CGFloat? = nil,
        leading: CGFloat? = nil,
        bottom: CGFloat? = nil,
        trailing: CGFloat? = nil,
        referringTo guide: NSLayoutGuide
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
        _ view: NSView,
        _ constant: CGFloat = 0
    ) -> NSLayoutConstraint {
        return anchor(topAnchor, equality, view.topAnchor, constant)
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
        _ view: NSView,
        _ constant: CGFloat = 0
    ) -> NSLayoutConstraint {
        return anchor(bottomAnchor, equality, view.bottomAnchor, constant)
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
        _ view: NSView,
        _ constant: CGFloat = 0
    ) -> NSLayoutConstraint {
        return anchor(leadingAnchor, equality, view.leadingAnchor, constant)
    }

    @discardableResult
    func trailing(
        _ equality: (Int, Int) -> (Bool),
        _ view: NSView,
        _ constant: CGFloat = 0
    ) -> NSLayoutConstraint {
        return anchor(trailingAnchor, equality, view.trailingAnchor, constant)
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
        _ view: NSView,
        _ constant: CGFloat = 0
    ) -> NSLayoutConstraint {
        return anchor(centerXAnchor, equality, view.centerXAnchor, constant)
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
        _ view: NSView,
        _ constant: CGFloat = 0
    ) -> NSLayoutConstraint {
        return anchor(centerYAnchor, equality, view.centerYAnchor, constant)
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
