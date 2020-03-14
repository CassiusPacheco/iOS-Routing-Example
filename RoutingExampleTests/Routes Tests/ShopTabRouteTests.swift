//
//  ShopTabRouteTests.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import XCTest
@testable import RoutingExample

final class ShopTabRouteTests: XCTestCase {
    func testMakeShopTab() {
        let router = RouterMock()
        let result = router.makeShopTab()

        XCTAssertEqual(router.routeToCallsCount, 0, "Nothing was opened")
        XCTAssertTrue(result.asNavigationsRootVC() is ShopViewController, "A navigation controller with a ShopVC is returned")
    }
}
