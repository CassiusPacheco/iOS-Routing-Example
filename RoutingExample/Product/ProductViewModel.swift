//
//  ProductViewModel.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 8/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation
import IntentsUI

final class ProductViewModel {
    typealias Routes = ProductRoute & PopUpRoute & SiriRoute
    private let router: Routes

    // Uses the router as the delegate to handle the intent controller orchestration.
    var siriButtonDelegate: INUIAddVoiceShortcutButtonDelegate {
        return router
    }

    init(router: Routes) {
        self.router = router
    }

    func productButtonTouchUpInside() {
        print("Product Button pressed")
        router.openProduct()
    }

    func wishlistButtonTouchUpInside() {
        print("Wishlist Button pressed")
        router.openPopUp(withMessage: "Product added to the Wishlist!")
    }
}
