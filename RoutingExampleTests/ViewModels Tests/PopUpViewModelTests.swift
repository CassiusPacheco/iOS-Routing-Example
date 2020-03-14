//
//  PopUpViewModelTests.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import XCTest
@testable import RoutingExample

final class PopUpViewModelTests: XCTestCase {
    func testDismissButtonTouchUpInside() {
        let routes = RoutesMock()
        let viewModel = PopUpViewModel(message: "something", router: routes)

        viewModel.dismissButtonTouchUpInside()

        XCTAssertEqual(routes.closeCallsCount, 1)
    }
}
