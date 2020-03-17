//
//  LoginViewModel.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 8/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation

final class LoginViewModel {
    typealias Routes = LoginRoute & SignUpRoute & ForgottenPasswordRoute & Closable
    private var router: Routes

    init(router: Routes) {
        self.router = router
    }

    func dismissButtonTouchUpInside() {
        print("Dismiss Button pressed")
        router.close()
    }

    func forgottenPasswordButtonTouchUpInside() {
        print("Forgot Password Button pressed")
        router.openForgottenPassword()
    }

    func signUpButtonTouchUpInside() {
        print("Sign Up Button pressed")
        router.openSignUp()
    }
}
