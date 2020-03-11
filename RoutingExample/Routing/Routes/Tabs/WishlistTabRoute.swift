//
//  WishlistTabRoute.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 11/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit
import DependencyContainer

protocol WishlistTabRoute {
    func makeWishlistTab() -> UIViewController
}

extension WishlistTabRoute where Self: Router {
    func makeWishlistTab() -> UIViewController {
        // No transitions since these are managed by the TabBarController
        let router = DefaultRouter(rootTransition: EmptyTransition(), container: container)
        let routes = router as WishlistViewModel.Routes
        let viewModel = container.resolve(WishlistViewModelInterface.self, argument: routes)
        let viewController = WishlistViewController(viewModel: viewModel)
        router.root = viewController

        let navigation = UINavigationController(rootViewController: viewController)
        navigation.tabBarItem = Tabs.wishlist.item
        return navigation
    }

    // This method isn't part of the interface and can only be used
    // internally by instances that conform to Router, like DefaultRouter,
    // DeeplinkRouter and others.
    func selectWishlistTab() {
        root?.tabBarController?.selectedIndex = Tabs.wishlist.index
    }
}

extension DefaultRouter: WishlistTabRoute {}
