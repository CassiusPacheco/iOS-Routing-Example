//
//  SignUpViewModelMock.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation
@testable import RoutingExample

class SignUpViewModelMock: SignUpViewModelInterface {
    var forgottenPasswordButtonTouchUpInsideCallsCount = 0
    var dismissButtonTouchUpInsideCallsCount = 0

    func dismissButtonTouchUpInside() {
        dismissButtonTouchUpInsideCallsCount += 1
    }

    func forgottenPasswordButtonTouchUpInside() {
        forgottenPasswordButtonTouchUpInsideCallsCount += 1
    }
}
