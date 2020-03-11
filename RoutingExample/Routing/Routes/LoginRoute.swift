//
//  LoginRoute.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 5/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit

protocol LoginRoute {
    func openLogin()
}

extension LoginRoute where Self: Router {
    // This method isn't part of the interface and can only be used
    // internally by instances that conform to Router, like DefaultRouter,
    // DeeplinkRouter and others.
    func openLogin(with transition: Transition) {
        // Passing the current Router's container into the newly created Router below
        let router = DefaultRouter(rootTransition: transition, container: container)

        // The LoginViewModelInterface was registered expecting an argument of the
        // type LoginViewModel.Routes. Even though DefaultRouter conforms to it,
        // ultimately it is of a different type, so we need to erase its type.
        let routes = router as LoginViewModel.Routes

        // Resolve the dependency by returning an instance that conforms to
        // LoginViewModelInterface. That may be a real or mock instance.
        // This is registered in the DependencyGraph.swift.
        let viewModel = container.resolve(LoginViewModelInterface.self, argument: routes)
        let viewController = LoginViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        router.root = viewController

        route(to: navigationController, as: transition)
    }

    func openLogin() {
        openLogin(with: ModalTransition())
    }
}

extension DefaultRouter: LoginRoute {}
