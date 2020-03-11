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
        // Passing the current Router's container into the newly created Router below.
        let router = DefaultRouter(rootTransition: transition, container: container)

        // The SignUpViewModelInterface was registered expecting an argument of the
        // type SignUpViewModel.Routes. Even though DefaultRouter conforms to it,
        // ultimately it is of a different type, so we need to erase its type.
        let routes = router as SignUpViewModel.Routes

        // Resolve the dependency by returning an instance that conforms to
        // SignUpViewModelInterface. That may be a real or mock instance.
        // This is registered in the DependencyGraph.swift.
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
