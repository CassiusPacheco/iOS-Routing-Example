//
//  ShopViewModelMock.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation
@testable import RoutingExample

class ShopViewModelMock: ShopViewModelInterface {
    var productButtonTouchUpInsideCallsCount = 0

    func productButtonTouchUpInside() {
        productButtonTouchUpInsideCallsCount += 1
    }
}
