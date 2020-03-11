//
//  ShopViewModel.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 8/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation

protocol ShopViewModelInterface {
    func productButtonTouchUpInside()
}

final class ShopViewModel: ShopViewModelInterface {
    typealias Routes = ProductRoute
    private let router: Routes

    init(router: Routes) {
        self.router = router
    }

    func productButtonTouchUpInside() {
        print("Product Button pressed")
        router.openProduct()
    }
}
