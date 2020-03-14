//
//  ProductViewModelMock.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation
import IntentsUI
@testable import RoutingExample

class ProductViewModelMock: ProductViewModelInterface {
    var wishlistButtonTouchUpInsideCallsCount = 0
    var productButtonTouchUpInsideCallsCount = 0

    // Override this underlying value for custom classes to be returned in `siriButtonDelegate`
    var underlyingSiriButtonDelegate: INUIAddVoiceShortcutButtonDelegate = AddVoiceShortcutButtonDelegateMock()

    var siriButtonDelegate: INUIAddVoiceShortcutButtonDelegate {
        return underlyingSiriButtonDelegate
    }

    func productButtonTouchUpInside() {
        productButtonTouchUpInsideCallsCount += 1
    }

    func wishlistButtonTouchUpInside() {
        wishlistButtonTouchUpInsideCallsCount += 1
    }
}
