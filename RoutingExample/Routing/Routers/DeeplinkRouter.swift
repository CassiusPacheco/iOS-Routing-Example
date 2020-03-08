//
//  DeeplinkRouter.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 8/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation

class DeeplinkRouter: DefaultRouter {}

extension DeeplinkRouter: Deeplinkable {
    /// Route to a view controller using the URL and transition provided.
    /// The `url` passed in must match one of the specificed routes in the `AppRoutes` enum.
    @discardableResult
    func route(to url: URL, as transition: Transition) -> Bool {
        guard let route = AppRoutes(url: url) else { return false }

        switch route {
        case .product:
            openProduct(with: transition)
        case .login:
            openLogin(with: transition)
        case .signUp:
            openSignUp(with: transition)
        case .wishlist:
            selectWishlistTab()
        case .shop:
            selectShopTab()
        }

        return true
    }
}

enum AppRoutes: String {
    case product = "product"
    case login = "login"
    case signUp = "sign-up"
    case wishlist = "wishlist"
    case shop = "shop"

    init?(url: URL) {
        // Transforms urls such as `www.routing.com/product?something=meh` into `product`
        guard let routes = AppRoutes(rawValue: url.lastPathComponent) else { return nil}
        self = routes
    }
}
