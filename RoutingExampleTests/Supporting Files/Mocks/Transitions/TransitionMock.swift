//
//  TransitionMock.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit
@testable import RoutingExample

class TransitionMock: Transition {
    // Received values
    var openViewControllerCallsCount = 0
    var openViewControllerReceivedVC: UIViewController?
    var openViewControllerReceivedFromVC: UIViewController?
    var openViewControllerReceivedCompletion: (() -> Void)?

    var closeViewControllerCallsCount = 0
    var closeViewControllerReceivedVC: UIViewController?
    var closeViewControllerReceivedCompletion: (() -> Void)?

    // Protocol implementation
    var isAnimated: Bool = true

    func open(_ viewController: UIViewController, from: UIViewController, completion: (() -> Void)?) {
        openViewControllerCallsCount += 1
        openViewControllerReceivedVC = viewController
        openViewControllerReceivedFromVC = from
        openViewControllerReceivedCompletion = completion
    }

    func close(_ viewController: UIViewController, completion: (() -> Void)?) {
        closeViewControllerCallsCount += 1
        closeViewControllerReceivedVC = viewController
        closeViewControllerReceivedCompletion = completion
    }
}
