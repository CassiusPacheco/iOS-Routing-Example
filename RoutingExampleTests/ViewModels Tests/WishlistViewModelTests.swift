//
//  WishlistViewModelTests.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import XCTest
@testable import RoutingExample

final class WishlistViewModelTests: XCTestCase {
    func testProductButtonTouchUpInside() {
        let routes = RoutesMock()
        let viewModel = WishlistViewModel(router: routes)

        viewModel.productButtonTouchUpInside()

        XCTAssertEqual(routes.openProductCallsCount, 1)
    }

    func testLoginButtonTouchUpInside() {
        let routes = RoutesMock()
        let viewModel = WishlistViewModel(router: routes)

        viewModel.loginButtonTouchUpInside()

        XCTAssertEqual(routes.openLoginCallsCount, 1)
    }
}
