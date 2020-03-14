//
//  SignUpRouteTests.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import XCTest
@testable import RoutingExample

final class SignUpRouteTests: XCTestCase {
    func testOpenSignUp() {
        let router = TestRouter()
        router.openSignUp()

        XCTAssertEqual(router.routeToCallsCount, 1)
        XCTAssertTrue(router.routeToReceivedVC is SignUpViewController, "The screen was presented as a SignUpVC")
        XCTAssertTrue(router.routeToReceivedTransition is PushTransition, "The screen was presented with a Push Transition")
    }
}

