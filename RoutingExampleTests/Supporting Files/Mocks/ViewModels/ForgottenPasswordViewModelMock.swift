//
//  ForgottenPasswordViewModelMock.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation
@testable import RoutingExample

class ForgottenPasswordViewModelMock: ForgottenPasswordViewModelInterface {
    var resetPasswordButtonTouchUpInsideCallsCount = 0

    func resetPasswordButtonTouchUpInside() {
        resetPasswordButtonTouchUpInsideCallsCount += 1
    }
}
