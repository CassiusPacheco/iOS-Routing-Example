//
//  ForgottenPasswordRoute.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 7/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation
import DependencyInjector

protocol ForgottenPasswordRoute {
    func openForgottenPassword()
}

extension ForgottenPasswordRoute where Self: Router {
    // This method isn't part of the interface and can only be used
    // internally by instances that conform to Router, like DefaultRouter,
    // DeeplinkRouter and others.
    func openForgottenPassword(with transition: Transition) {
        // If the `Router` makes use of a DI container it can resolve
        // the dependencies in a clean and testable way by doing something like:
        //
        // let viewController = container.resolve(ForgottenPasswordViewController.self, argument: router)

        let router = DefaultRouter(rootTransition: transition, container: container)
        let routes = router as ForgottenPasswordViewModel.Routes
        let viewModel = container.resolve(ForgottenPasswordViewModelInterface.self, argument: routes)
        let viewController = ForgottenPasswordViewController(viewModel: viewModel)
        router.root = viewController

        route(to: viewController, as: transition)
    }

    func openForgottenPassword() {
        openForgottenPassword(with: PushTransition())
    }
}

extension DefaultRouter: ForgottenPasswordRoute {}
