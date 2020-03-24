//
//  PopUpRouteTests.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import XCTest
@testable import RoutingExample

final class PopUpRouteTests: XCTestCase {
    func testOpenPopUp() {
        let router = RouterMock()
        router.openPopUp(withMessage: "Something!")

        XCTAssertEqual(router.routeToCallsCount, 1)
        XCTAssertTrue(router.routeToReceivedVC is PopUpViewController, "The screen was presented with a PopUpViewController")
        XCTAssertTrue(router.routeToReceivedTransition is AnimatedTransition, "The screen was presented with an Animated Transition")
        XCTAssertTrue((router.routeToReceivedTransition as? AnimatedTransition)?.animatedTransition is FadeAnimatedTransitioning, "The Animated Transition is a Fade animation")
    }
}
