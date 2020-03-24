//
//  ShopViewModelTests.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import XCTest
@testable import RoutingExample

final class ShopViewModelTests: XCTestCase {
    func testProductButtonTouchUpInside() {
        let routes = RoutesMock()
        let viewModel = ShopViewModel(router: routes)

        viewModel.productButtonTouchUpInside()

        XCTAssertEqual(routes.openProductCallsCount, 1)
    }
}
