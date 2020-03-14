//
//  LoginRouteTests.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import XCTest
@testable import RoutingExample

final class LoginRouteTests: XCTestCase {
    func testOpenLogin() {
        let router = TestRouter()
        router.openLogin()

        XCTAssertEqual(router.routeToCallsCount, 1)
        XCTAssertTrue(router.routeToReceivedVC?.asNavigationsRootVC() is LoginViewController, "The screen was presented embedded in a Navigation Controller")
        XCTAssertTrue(router.routeToReceivedTransition is ModalTransition, "The screen was presented with a Modal Transition")
    }
}
