//
//  SignUpRoute.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 5/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation

protocol SignUpRoute {
    func openSignUp()
}

extension SignUpRoute where Self: Router {
    // This method isn't part of the interface and can only be used
    // internally by instances that conform to Router, like DefaultRouter,
    // DeeplinkRouter and others.
    func openSignUp(with transition: Transition) {
        // If the `Router` makes use of a DI container it can resolve
        // the dependencies in a clean and testable way by doing something like:
        //
        // let viewController = container.resolve(SignUpViewController.self, argument: router)

        let router = DefaultRouter(rootTransition: transition, container: container)
        let routes = router as SignUpViewModel.Routes
        let viewModel = container.resolve(SignUpViewModelInterface.self, argument: routes)
        let viewController = SignUpViewController(viewModel: viewModel)
        router.root = viewController

        route(to: viewController, as: transition)
    }

    func openSignUp() {
        openSignUp(with: PushTransition())
    }
}

extension DefaultRouter: SignUpRoute {}
