//
//  UIViewController.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit

extension UIViewController {
    /// Cast view controller to a `UINavigationViewController` and returns its root view controller.
    /// Returns `nil` if `self` isn't a `UINavigationViewController`.
    func asNavigationsRootVC() -> UIViewController? {
        return (self as? UINavigationController)?.viewControllers.first
    }
}
