//
//  SignUpViewModel.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 8/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation

protocol SignUpViewModelInterface {
    func forgottenPasswordButtonTouchUpInside()
    func dismissButtonTouchUpInside()
}

final class SignUpViewModel: SignUpViewModelInterface {
    typealias Routes = ForgottenPasswordRoute & Dismissable
    private var router: Routes

    init(router: Routes) {
        self.router = router
    }

    func forgottenPasswordButtonTouchUpInside() {
        print("Forgotten Password Button pressed")
        router.openForgottenPassword()
    }

    func dismissButtonTouchUpInside() {
        print("Dismiss Button pressed")
        router.dismiss()
    }
}
