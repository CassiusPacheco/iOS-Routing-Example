//
//  ProductRouteTests.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import XCTest
@testable import RoutingExample

final class ProductRouteTests: XCTestCase {
    func testOpenProduct() {
        let router = RouterMock()
        router.openProduct()

        XCTAssertEqual(router.routeToCallsCount, 1)
        XCTAssertTrue(router.routeToReceivedVC is ProductViewController, "The screen was presented as a ProductVC")
        XCTAssertTrue(router.routeToReceivedTransition is PushTransition, "The screen was presented with a Push Transition")
    }
}
