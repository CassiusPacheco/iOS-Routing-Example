//
//  WishlistViewModel.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 8/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation

final class WishlistViewModel {
    typealias Routes = LoginRoute & ProductRoute
    private let router: Routes

    init(router: Routes) {
        self.router = router
    }

    func productButtonTouchUpInside() {
        print("Product Button pressed")
        router.openProduct()
    }

    func loginButtonTouchUpInside() {
        print("Login Button pressed")
        router.openLogin()
    }
}
