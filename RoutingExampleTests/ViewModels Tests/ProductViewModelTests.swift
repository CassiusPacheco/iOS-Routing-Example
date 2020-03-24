//
//  ProductViewModelTests.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import XCTest
@testable import RoutingExample

final class ProductViewModelTests: XCTestCase {
    func testProductButtonTouchUpInside() {
        let routes = RoutesMock()
        let viewModel = ProductViewModel(router: routes)

        viewModel.productButtonTouchUpInside()

        XCTAssertEqual(routes.openProductCallsCount, 1)
    }

    func testWishlistButtonTouchUpInside() {
        let routes = RoutesMock()
        let viewModel = ProductViewModel(router: routes)

        viewModel.wishlistButtonTouchUpInside()

        XCTAssertEqual(routes.openPopUpWithMessageCallsCount, 1)
        XCTAssertEqual(routes.openPopUpWithMessageReceivedMessage, "Product added to the Wishlist!")
    }

    func testSiriButtonDelegate() {
        let routes = RoutesMock()
        let viewModel = ProductViewModel(router: routes)

        XCTAssertTrue(viewModel.siriButtonDelegate === routes)
    }
}
