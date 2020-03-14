//
//  TestRouter.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit
import DependencyContainer
@testable import RoutingExample

class TestRouter: DefaultRouter {
    var routeToCompletionCallsCount = 0
    var routeToCompletionReceivedVC: UIViewController?
    var routeToCompletionReceivedTransition: Transition?
    var routeToCompletionReceivedCompletion: (() -> Void)?

    var routeToCallsCount = 0
    var routeToReceivedVC: UIViewController?
    var routeToReceivedTransition: Transition?

    var closeCompletionCallsCount = 0
    var closeCompletionReceivedCompletion: (() -> Void)?

    var closeCallsCount = 0

    var dismissCompletionCallsCount = 0
    var dismissCompletionReceivedCompletion: (() -> Void)?

    var dismissCallsCount = 0

    override init(rootTransition: Transition = TransitionMock(), container: DependencyContainer = DependencyContainer.mock()) {
        super.init(rootTransition: rootTransition, container: container)
    }

    override func route(to viewController: UIViewController, as transition: Transition, completion: (() -> Void)?) {
        routeToCompletionCallsCount += 1
        routeToCompletionReceivedVC = viewController
        routeToCompletionReceivedTransition = transition
        routeToCompletionReceivedCompletion = completion
    }

    override func route(to viewController: UIViewController, as transition: Transition) {
        routeToCallsCount += 1
        routeToReceivedVC = viewController
        routeToReceivedTransition = transition
    }

    override func close(completion: (() -> Void)?) {
        closeCompletionCallsCount += 1
        closeCompletionReceivedCompletion = completion
    }

    override func close() {
        closeCallsCount += 1
    }

    override func dismiss(completion: (() -> Void)?) {
        dismissCompletionCallsCount += 1
        dismissCompletionReceivedCompletion = completion
    }

    override func dismiss() {
        dismissCallsCount += 1
    }
}
