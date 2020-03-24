//
//  WishlistTabRouteTests.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import XCTest
@testable import RoutingExample

final class WishlistTabRouteTests: XCTestCase {
    func testMakeWishlistTab() {
        let router = RouterMock()
        let result = router.makeWishlistTab()

        XCTAssertEqual(router.routeToCallsCount, 0, "Nothing was opened")
        XCTAssertTrue(result.asNavigationsRootVC() is WishlistViewController, "A navigation controller with a WishlistVC is returned")
    }
}
