//
//  ForgottenPasswordViewModelTests.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import XCTest
@testable import RoutingExample

final class ForgottenPasswordViewModelTests: XCTestCase {
    func testResetPasswordButtonTouchUpInside() {
        let routes = RoutesMock()
        let viewModel = ForgottenPasswordViewModel(router: routes)

        viewModel.resetPasswordButtonTouchUpInside()

        XCTAssertEqual(routes.openPopUpWithMessageCallsCount, 1)
        XCTAssertEqual(routes.openPopUpWithMessageReceivedMessage, "E-mail sent")
    }
}
