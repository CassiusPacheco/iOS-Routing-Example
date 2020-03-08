//
//  ProductRoute.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 7/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation

protocol ProductRoute {
    func openProduct()
}

extension ProductRoute where Self: Router {
    // This method isn't part of the interface and can only be used
    // internally by instances that conform to Router, like DefaultRouter,
    // DeeplinkRouter and others.
    func openProduct(with transition: Transition) {
        // If the `Router` makes use of a DI container it can resolve
        // the dependencies in a clean and testable way by doing something like:
        //
        // let viewController = container.resolve(ProductViewController.self, argument: router)

        let router = SiriRouter(rootTransition: transition)
        let viewModel = ProductViewModel(router: router)
        let viewController = ProductViewController(viewModel: viewModel)
        router.root = viewController

        route(to: viewController, as: transition)
    }

    func openProduct() {
        openProduct(with: PushTransition())
    }
}

extension DefaultRouter: ProductRoute {}
