//
//  WishlistViewModelMock.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation
@testable import RoutingExample

class WishlistViewModelMock: WishlistViewModelInterface {
    var productButtonTouchUpInsideCallsCount = 0
    var loginButtonTouchUpInsideCallsCount = 0

    func productButtonTouchUpInside() {
        productButtonTouchUpInsideCallsCount += 1
    }

    func loginButtonTouchUpInside() {
        loginButtonTouchUpInsideCallsCount += 1
    }
}
