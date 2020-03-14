//
//  PopUpViewModelMock.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation
@testable import RoutingExample

class PopUpViewModelMock: PopUpViewModelInterface {
    var dismissButtonTouchUpInsideCallsCount = 0
    var underlyingMessage: String = "test"

    var message: String {
        return underlyingMessage
    }

    func dismissButtonTouchUpInside() {
        dismissButtonTouchUpInsideCallsCount += 1
    }
}
