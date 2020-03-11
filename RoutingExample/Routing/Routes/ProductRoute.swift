//
//  ProductRoute.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 7/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation
import DependencyContainer

protocol ProductRoute {
    func openProduct()
}

extension ProductRoute where Self: Router {
    // This method isn't part of the interface and can only be used
    // internally by instances that conform to Router, like DefaultRouter,
    // DeeplinkRouter and others.
    func openProduct(with transition: Transition) {
        // Passing the current Router's container into the newly created Router below
        let router = SiriRouter(rootTransition: transition, container: container)

        // The ProductViewModelInterface was registered expecting an argument of the
        // type ProductViewModel.Routes. Even though DefaultRouter conforms to it,
        // ultimately it is of a different type, so we need to erase its type.
        let routes = router as ProductViewModel.Routes

        // Resolve the dependency by returning an instance that conforms to
        // ProductViewModelInterface. That may be a real or mock instance.
        // This is registered in the DependencyGraph.swift.
        let viewModel = container.resolve(ProductViewModelInterface.self, argument: routes)
        let viewController = ProductViewController(viewModel: viewModel)
        router.root = viewController

        route(to: viewController, as: transition)
    }

    func openProduct() {
        openProduct(with: PushTransition())
    }
}

extension DefaultRouter: ProductRoute {}
