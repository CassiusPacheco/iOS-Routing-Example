//
//  UIViewController.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 8/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit

// From: https://gist.github.com/CassiusPacheco/a3887e5da50ec2f5fe0e7e9d072a4937
extension UIViewController {
    /// Goes recursively through the `window`'s `rootViewController` hierarchy to return the top most controller.
    /// This method takes care of multiple presentation stacks being used by different view controllers, navigation controllers
    /// and tab bar controllers.
    /// May return `nil` if the window's `rootViewController` is not set. For all the other cases it should return a
    /// valid controller as long as there's something visible to the users.
    @objc
    func topMostViewController(for window: UIWindow? = UIApplication.shared.windows.first) -> UIViewController? {
        guard let rootViewController = window?.rootViewController else {
            assertionFailure("Window should always be available")
            return nil
        }

        var top: UIViewController? = rootViewController

        while true {
            if let presented = top?.presentedViewController {
                top = presented
            } else if let nav = top as? UINavigationController {
                top = nav.visibleViewController
            } else if let tab = top as? UITabBarController {
                top = tab.selectedViewController
            } else {
                break
            }
        }

        return top
    }
}

extension UIWindow {
    /// Goes recursively through the `window`'s `rootViewController` hierarchy to return the top most controller.
    /// This method takes care of multiple presentation stacks being used by different view controllers, navigation controllers
    /// and tab bar controllers.
    /// May return `nil` if the window's `rootViewController` is not set. For all the other cases it should return a
    /// valid controller as long as there's something visible to the users.
    func topMostViewController() -> UIViewController? {
        return rootViewController?.topMostViewController(for: self)
    }
}
