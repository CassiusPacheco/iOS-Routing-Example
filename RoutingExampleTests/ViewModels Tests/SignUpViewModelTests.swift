//
//  SignUpViewModelTests.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import XCTest
@testable import RoutingExample

final class SignUpViewModelTests: XCTestCase {
    func testDismissButtonTouchUpInside() {
        let routes = RoutesMock()
        let viewModel = SignUpViewModel(router: routes)

        viewModel.dismissButtonTouchUpInside()

        XCTAssertEqual(routes.dismissCallsCount, 1)
    }

    func testForgottenPasswordButtonTouchUpInside() {
        let routes = RoutesMock()
        let viewModel = SignUpViewModel(router: routes)

        viewModel.forgottenPasswordButtonTouchUpInside()

        XCTAssertEqual(routes.openForgottenPasswordCallsCount, 1)
    }
}
