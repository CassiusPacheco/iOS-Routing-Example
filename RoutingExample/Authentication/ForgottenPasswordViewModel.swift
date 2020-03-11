//
//  ForgottenPasswordViewModel.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 8/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation

protocol ForgottenPasswordViewModelInterface {
    func resetPasswordButtonTouchUpInside()
}

final class ForgottenPasswordViewModel: ForgottenPasswordViewModelInterface {
    typealias Routes = PopUpRoute
    private let router: Routes

    init(router: Routes) {
        self.router = router
    }

    func resetPasswordButtonTouchUpInside() {
        print("Reset Password Button pressed")
        router.openPopUp(withMessage: "E-mail sent")
    }
}
