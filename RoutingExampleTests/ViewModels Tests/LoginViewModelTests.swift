//
//  LoginViewModelTests.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import XCTest
@testable import RoutingExample

final class LoginViewModelTests: XCTestCase {
    func testDismissButtonTouchUpInside() {
        let routes = RoutesMock()
        let viewModel = LoginViewModel(router: routes)

        viewModel.dismissButtonTouchUpInside()

        XCTAssertEqual(routes.closeCallsCount, 1)
    }

    func testForgottenPasswordButtonTouchUpInside() {
        let routes = RoutesMock()
        let viewModel = LoginViewModel(router: routes)

        viewModel.forgottenPasswordButtonTouchUpInside()

        XCTAssertEqual(routes.openForgottenPasswordCallsCount, 1)
    }

    func testSignUpButtonTouchUpInside() {
        let routes = RoutesMock()
        let viewModel = LoginViewModel(router: routes)

        viewModel.signUpButtonTouchUpInside()

        XCTAssertEqual(routes.openSignUpCallsCount, 1)
    }
}
