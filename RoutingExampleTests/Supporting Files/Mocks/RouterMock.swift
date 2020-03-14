//
//  RouterMock.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit
import DependencyContainer
@testable import RoutingExample

class RouterMock: NSObject, Router, Closable, Dismissable {
    var root: UIViewController?
    var container: DependencyContainer

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

    init(container: DependencyContainer = DependencyContainer.mock()) {
        self.container = container
    }

    func route(to viewController: UIViewController, as transition: Transition, completion: (() -> Void)?) {
        routeToCompletionCallsCount += 1
        routeToCompletionReceivedVC = viewController
        routeToCompletionReceivedTransition = transition
        routeToCompletionReceivedCompletion = completion
    }

    func route(to viewController: UIViewController, as transition: Transition) {
        routeToCallsCount += 1
        routeToReceivedVC = viewController
        routeToReceivedTransition = transition
    }

    func close(completion: (() -> Void)?) {
        closeCompletionCallsCount += 1
        closeCompletionReceivedCompletion = completion
    }

    func close() {
        closeCallsCount += 1
    }

    func dismiss(completion: (() -> Void)?) {
        dismissCompletionCallsCount += 1
        dismissCompletionReceivedCompletion = completion
    }

    func dismiss() {
        dismissCallsCount += 1
    }
}

// Add all routes in the app as extension
extension RouterMock: PopUpRoute {}
extension RouterMock: ForgottenPasswordRoute {}
extension RouterMock: SignUpRoute {}
extension RouterMock: ProductRoute {}
extension RouterMock: LoginRoute {}
extension RouterMock: ShopTabRoute {}
extension RouterMock: WishlistTabRoute {}
