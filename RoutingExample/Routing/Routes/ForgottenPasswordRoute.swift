//
//  ForgottenPasswordRoute.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 7/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation
import DependencyContainer

protocol ForgottenPasswordRoute {
    func openForgottenPassword()
}

extension ForgottenPasswordRoute where Self: Router {
    // This method isn't part of the interface and can only be used
    // internally by instances that conform to Router, like DefaultRouter,
    // DeeplinkRouter and others.
    func openForgottenPassword(with transition: Transition) {
        // Passing the current Router's container into the newly created Router below
        let router = DefaultRouter(rootTransition: transition, container: container)

        // The ForgottenPasswordViewModelInterface was registered expecting an argument of the
        // type ForgottenPasswordViewModel.Routes. Even though DefaultRouter conforms to it,
        // ultimately it is of a different type, so we need to erase its type.
        let routes = router as ForgottenPasswordViewModel.Routes

        // Resolve the dependency by returning an instance that conforms to
        // ForgottenPasswordViewModelInterface. That may be a real or mock instance.
        // This is registered in the DependencyGraph.swift.
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
