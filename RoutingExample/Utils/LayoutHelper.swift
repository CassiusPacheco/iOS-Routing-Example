//
//  LayoutHelper.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 7/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation
import UIKit

// From: https://gist.github.com/CassiusPacheco/17ac1af2f7c1fb12c48ee0c252980468
public func associatedObject<ValueType: Any>(base: AnyObject, key: UnsafePointer<UInt8>, initializer: () -> ValueType)
    -> ValueType {
    // if there is already an associated value returns it
    if let associated = objc_getAssociatedObject(base, key) as? ValueType {
        return associated
    }

    // associated value not found, initializes closure, makes the association and returns it
    let associated = initializer()
    associateObject(base: base, key: key, value: associated)

    return associated
}

public func associateObject<ValueType: Any>(base: AnyObject, key: UnsafePointer<UInt8>, value: ValueType) {
    objc_setAssociatedObject(base, key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
}

// Add a `layout` property to all UIViews
private struct AssociatedKeys {
    static var layout: UInt8 = 0
}

extension UIView {
    // MARK: - Autolayout Helper
    var layout: LayoutHelper {
        return associatedObject(base: self, key: &AssociatedKeys.layout, initializer: { () -> LayoutHelper in
            return LayoutHelper(view: self)
        })
    }
}

// LayoutHelper adds a bit of sugar syntax to NSLayoutConstraints
struct LayoutHelper {
    private weak var view: UIView?

    init(view: UIView) {
        self.view = view
    }

    typealias PinConstraints = (leading: NSLayoutConstraint?, trailing: NSLayoutConstraint?, top: NSLayoutConstraint?, bottom: NSLayoutConstraint?)
    @discardableResult
    func pin(to outerView: UIView, edgeInsets: UIEdgeInsets = .zero, priority: UILayoutPriority = .required) -> PinConstraints {
        guard let view = self.view else {
            assertionFailure("View cannot be nil")
            return (nil, nil, nil, nil)
        }

        view.translatesAutoresizingMaskIntoConstraints = false

        let leading = view.leadingAnchor.constraint(equalTo: outerView.leadingAnchor, constant: edgeInsets.left)
        let trailing = view.trailingAnchor.constraint(equalTo: outerView.trailingAnchor, constant: -edgeInsets.right)
        let top = view.topAnchor.constraint(equalTo: outerView.topAnchor, constant: edgeInsets.top)
        let bottom = view.bottomAnchor.constraint(equalTo: outerView.bottomAnchor, constant: -edgeInsets.bottom)

        let constraints = [leading, trailing, top, bottom]
        constraints.forEach { $0.priority = priority }
        NSLayoutConstraint.activate(constraints)

        return (leading, trailing, top, bottom)
    }

    @discardableResult
    func center(in otherView: UIView, offset: CGPoint = .zero, priority: UILayoutPriority = .required) -> (centerX: NSLayoutConstraint?, centerY: NSLayoutConstraint?) {
        guard let view = self.view else {
            assertionFailure("View cannot be nil")
            return (nil, nil)
        }

        view.translatesAutoresizingMaskIntoConstraints = false

        let centerX = view.centerXAnchor.constraint(equalTo: otherView.centerXAnchor, constant: offset.x)
        let centerY = view.centerYAnchor.constraint(equalTo: otherView.centerYAnchor, constant: offset.y)

        let constraints = [centerX, centerY]
        constraints.forEach { $0.priority = priority }
        NSLayoutConstraint.activate(constraints)

        return (centerX, centerY)
    }

    @discardableResult
    func constrain(size: CGSize, priority: UILayoutPriority = .required) -> (width: NSLayoutConstraint?, height: NSLayoutConstraint?) {
        return constrain(width: size.width, height: size.height, priority: priority)
    }

    @discardableResult
    func constrain(width: CGFloat? = nil, height: CGFloat? = nil, priority: UILayoutPriority = .required) -> (width: NSLayoutConstraint?, height: NSLayoutConstraint?) {
        guard let view = self.view else {
            assertionFailure("View cannot be nil")
            return (nil, nil)
        }

        view.translatesAutoresizingMaskIntoConstraints = false

        var widthConstraint: NSLayoutConstraint?
        if let width = width {
            widthConstraint = view.widthAnchor.constraint(equalToConstant: width)
            widthConstraint?.priority = priority
            widthConstraint?.isActive = true
        }

        var heightConstraint: NSLayoutConstraint?
        if let height = height {
            heightConstraint = view.heightAnchor.constraint(equalToConstant: height)
            heightConstraint?.priority = priority
            heightConstraint?.isActive = true
        }

        return (widthConstraint, heightConstraint)
    }

    enum AnchorWithOffset {
        case top(_ offset: CGFloat = 0)
        case bottom(_ offset: CGFloat = 0)
        case leading(_ offset: CGFloat = 0)
        case trailing(_ offset: CGFloat = 0)
        case centerY(_ offset: CGFloat = 0)
        case centerX(_ offset: CGFloat = 0)
        case height(_ offset: CGFloat = 0)
        case width(_ offset: CGFloat = 0)
    }

    @discardableResult
    func constrain(anchors: [AnchorWithOffset], equalTo otherView: UIView, priority: UILayoutPriority = .required) -> [NSLayoutConstraint] {
        guard let view = self.view else {
            assertionFailure("View cannot be nil")
            return []
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []

        for anchor in anchors {
            switch anchor {
            case let .top(offset):
                constraints.append(view.topAnchor.constraint(equalTo: otherView.topAnchor, constant: offset))
            case let .bottom(offset):
                constraints.append(view.bottomAnchor.constraint(equalTo: otherView.bottomAnchor, constant: offset))
            case let .leading(offset):
                constraints.append(view.leadingAnchor.constraint(equalTo: otherView.leadingAnchor, constant: offset))
            case let .trailing(offset):
                constraints.append(view.trailingAnchor.constraint(equalTo: otherView.trailingAnchor, constant: offset))
            case let .centerY(offset):
                constraints.append(view.centerYAnchor.constraint(equalTo: otherView.centerYAnchor, constant: offset))
            case let .centerX(offset):
                constraints.append(view.centerXAnchor.constraint(equalTo: otherView.centerXAnchor, constant: offset))
            case let .height(offset):
                constraints.append(view.heightAnchor.constraint(equalTo: otherView.heightAnchor, constant: offset))
            case let .width(offset):
                constraints.append(view.widthAnchor.constraint(equalTo: otherView.widthAnchor, constant: offset))
            }
        }

        constraints.forEach { $0.priority = priority }
        NSLayoutConstraint.activate(constraints)

        return constraints
    }

    @discardableResult
    func constrain(anchors: [AnchorWithOffset], greaterThanOrEqualTo otherView: UIView, priority: UILayoutPriority = .required) -> [NSLayoutConstraint] {
        guard let view = self.view else {
            assertionFailure("View cannot be nil")
            return []
        }

        view.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []

        for anchor in anchors {
            switch anchor {
            case let .top(offset):
                constraints.append(view.topAnchor.constraint(greaterThanOrEqualTo: otherView.topAnchor, constant: offset))
            case let .bottom(offset):
                constraints.append(view.bottomAnchor.constraint(greaterThanOrEqualTo: otherView.bottomAnchor, constant: offset))
            case let .leading(offset):
                constraints.append(view.leadingAnchor.constraint(greaterThanOrEqualTo: otherView.leadingAnchor, constant: offset))
            case let .trailing(offset):
                constraints.append(view.trailingAnchor.constraint(greaterThanOrEqualTo: otherView.trailingAnchor, constant: offset))
            case let .centerY(offset):
                constraints.append(view.centerYAnchor.constraint(greaterThanOrEqualTo: otherView.centerYAnchor, constant: offset))
            case let .centerX(offset):
                constraints.append(view.centerXAnchor.constraint(greaterThanOrEqualTo: otherView.centerXAnchor, constant: offset))
            case let .height(offset):
                constraints.append(view.heightAnchor.constraint(greaterThanOrEqualTo: otherView.heightAnchor, constant: offset))
            case let .width(offset):
                constraints.append(view.widthAnchor.constraint(greaterThanOrEqualTo: otherView.widthAnchor, constant: offset))
            }
        }

        constraints.forEach { $0.priority = priority }
        NSLayoutConstraint.activate(constraints)

        return constraints
    }

    @discardableResult
    func constrain(anchors: [AnchorWithOffset], lessThanOrEqualTo otherView: UIView, priority: UILayoutPriority = .required) -> [NSLayoutConstraint] {
        guard let view = self.view else {
            assertionFailure("View cannot be nil")
            return []
        }

        view.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []

        for anchor in anchors {
            switch anchor {
            case let .top(offset):
                constraints.append(view.topAnchor.constraint(lessThanOrEqualTo: otherView.topAnchor, constant: offset))
            case let .bottom(offset):
                constraints.append(view.bottomAnchor.constraint(lessThanOrEqualTo: otherView.bottomAnchor, constant: offset))
            case let .leading(offset):
                constraints.append(view.leadingAnchor.constraint(lessThanOrEqualTo: otherView.leadingAnchor, constant: offset))
            case let .trailing(offset):
                constraints.append(view.trailingAnchor.constraint(lessThanOrEqualTo: otherView.trailingAnchor, constant: offset))
            case let .centerY(offset):
                constraints.append(view.centerYAnchor.constraint(lessThanOrEqualTo: otherView.centerYAnchor, constant: offset))
            case let .centerX(offset):
                constraints.append(view.centerXAnchor.constraint(lessThanOrEqualTo: otherView.centerXAnchor, constant: offset))
            case let .height(offset):
                constraints.append(view.heightAnchor.constraint(lessThanOrEqualTo: otherView.heightAnchor, constant: offset))
            case let .width(offset):
                constraints.append(view.widthAnchor.constraint(lessThanOrEqualTo: otherView.widthAnchor, constant: offset))
            }
        }

        constraints.forEach { $0.priority = priority }
        NSLayoutConstraint.activate(constraints)

        return constraints
    }
}
