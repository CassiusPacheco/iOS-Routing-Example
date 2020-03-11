//
//  PopUpRoute.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 7/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation

protocol PopUpRoute {
    func openPopUp(withMessage message: String)
}

extension PopUpRoute where Self: Router {
    // This method isn't part of the interface and can only be used
    // internally by instances that conform to Router, like DefaultRouter,
    // DeeplinkRouter and others.
    func openPopUp(withMessage message: String, transition: Transition) {
        // Passing the current Router's container into the newly created Router below
        let router = DefaultRouter(rootTransition: transition, container: container)

        // The PopUpViewModelInterface was registered expecting an argument of the
        // type PopUpViewModel.Routes. Even though DefaultRouter conforms to it,
        // ultimately it is of a different type, so we need to erase its type.
        let routes = router as PopUpViewModel.Routes

        // Resolve the dependency by returning an instance that conforms to
        // PopUpViewModelInterface. That may be a real or mock instance.
        // This is registered in the DependencyGraph.swift.
        let viewModel = container.resolve(PopUpViewModelInterface.self, arguments: message, routes)
        let viewController = PopUpViewController(viewModel: viewModel)
        router.root = viewController

        route(to: viewController, as: transition)
    }

    func openPopUp(withMessage message: String) {
        let transition = AnimatedTransition(animatedTransition: FadeAnimatedTransitioning())
        openPopUp(withMessage: message, transition: transition)
    }
}

extension DefaultRouter: PopUpRoute {}
