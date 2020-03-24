//
//  ForgottenPasswordRouteTests.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import XCTest
@testable import RoutingExample

final class ForgottenPasswordRouteTests: XCTestCase {
    func testOpenForgottenPassword() {
        let router = RouterMock()
        router.openForgottenPassword()

        XCTAssertEqual(router.routeToCallsCount, 1)
        XCTAssertTrue(router.routeToReceivedVC is ForgottenPasswordViewController, "The screen was presented as a ForgottenPasswordVC")
        XCTAssertTrue(router.routeToReceivedTransition is PushTransition, "The screen was presented with a Push Transition")
    }
}
