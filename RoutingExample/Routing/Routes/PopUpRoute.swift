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
        // If the `Router` makes use of a DI container it can resolve
        // the dependencies in a clean and testable way by doing something like:
        //
        // let viewController = container.resolve(PopUpViewController.self, argument: router)

        let router = DefaultRouter(rootTransition: transition)
        let viewModel = PopUpViewModel(message: message, router: router)
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
