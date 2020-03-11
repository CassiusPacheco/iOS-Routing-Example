//
//  ShopTabRoute.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 11/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit
import DependencyInjector

protocol ShopTabRoute {
    func makeShopTab() -> UIViewController
}

extension ShopTabRoute where Self: Router {
    func makeShopTab() -> UIViewController {
        // No transitions since these are managed by the TabBarController
        let router = DefaultRouter(rootTransition: EmptyTransition(), container: container)
        let routes = router as ShopViewModel.Routes
        let viewModel = container.resolve(ShopViewModelInterface.self, argument: routes)
        let viewControlle = ShopViewController(viewModel: viewModel)
        router.root = viewControlle

        let navigation = UINavigationController(rootViewController: viewControlle)
        navigation.tabBarItem = Tabs.shop.item
        return navigation
    }

    // This method isn't part of the interface and can only be used
    // internally by instances that conform to Router, like DefaultRouter,
    // DeeplinkRouter and others.
    func selectShopTab() {
        root?.tabBarController?.selectedIndex = Tabs.shop.index
    }
}

extension DefaultRouter: ShopTabRoute {}
