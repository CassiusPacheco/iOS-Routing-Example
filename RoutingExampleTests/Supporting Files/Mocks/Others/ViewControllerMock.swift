//
//  ViewControllerMock.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit

final class ViewControllerMock: UIViewController {
    // MARK: - TabBarController
    var underlyingTabBarController: UITabBarController?

    override var tabBarController: UITabBarController? {
        get {
            return underlyingTabBarController
        }
    }

    // MARK: - PresentedControllers

    private(set) var presentedControllers = [UIViewController]()

    // MARK: - Presented

    var presentWithControllerCalled: Bool {
        return presentWithControllerCalledCount > 0
    }

    private(set) var presentWithControllerCalledCount = 0
    private(set) var presentWithControllerArguments: (viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?)?

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentedControllers.append(viewControllerToPresent)

        presentWithControllerCalledCount += 1
        presentWithControllerArguments = (viewControllerToPresent: viewControllerToPresent, animated: flag, completion: completion)
    }

    // MARK: - Dismissed

    private(set) var currentDismissedController: UIViewController?

    var dismissWithAnimatedCalled: Bool {
        return dismissWithAnimatedCalledCount > 0
    }

    private(set) var dismissWithAnimatedCalledCount = 0
    private(set) var dismissWithAnimatedArguments: (animated: Bool, completion: (() -> Void)?)?

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        currentDismissedController = presentedControllers.popLast()

        dismissWithAnimatedCalledCount += 1
        dismissWithAnimatedArguments = (animated: flag, completion: completion)
    }
}
