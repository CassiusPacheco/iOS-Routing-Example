//
//  TestRoutes.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit
@testable import RoutingExample

class RoutesMock: AddVoiceShortcutButtonDelegateMock, ForgottenPasswordRoute, LoginRoute, ProductRoute, PopUpRoute, ShopTabRoute, SignUpRoute, SiriRoute, WishlistTabRoute, Closable, Dismissable {
    // MARK: - ForgottenPasswordRoute
    var openForgottenPasswordCallsCount = 0

    func openForgottenPassword() {
        openForgottenPasswordCallsCount += 1
    }

    // MARK: - LoginRoute

    var openLoginCallsCount = 0

    func openLogin() {
        openLoginCallsCount += 1
    }

    // MARK: - ProductRoute

    var openProductCallsCount = 0

    func openProduct() {
        openProductCallsCount += 1
    }

    // MARK: - PopUpRoute

    var openPopUpWithMessageCallsCount = 0
    var openPopUpWithMessageReceivedMessage: String?

    func openPopUp(withMessage message: String) {
        openPopUpWithMessageCallsCount += 1
        openPopUpWithMessageReceivedMessage = message
    }

    // MARK: - ShopTabRoute

    var makeShopTabCallsCount = 0
    var makeShopTabReturnValue: UIViewController!

    func makeShopTab() -> UIViewController {
        makeShopTabCallsCount += 1
        return makeShopTabReturnValue
    }

    // MARK: - SignUpRoute

    var openSignUpCallsCount = 0

    func openSignUp() {
        openSignUpCallsCount += 1
    }

    // MARK: - WishlistTabRoute

    var makeWishlistTabCallsCount = 0
    var makeWishlistTabReturnValue: UIViewController!

    func makeWishlistTab() -> UIViewController {
        makeWishlistTabCallsCount += 1
        return makeWishlistTabReturnValue
    }

    // MARK: - Closable

    var closeCallsCount = 0

    var closeCompletionCallsCount = 0
    var closeCompletionReceivedCompletion: (() -> Void)?

    func close() {
        closeCallsCount += 1
    }

    func close(completion: (() -> Void)?) {
        closeCompletionCallsCount += 1
        closeCompletionReceivedCompletion = completion
    }

    // MARK: - Dismissable

    var dismissCallsCount = 0

    var dismissCompletionCallsCount = 0
    var dismissCompletionReceivedCompletion: (() -> Void)?

    func dismiss() {
        dismissCallsCount += 1
    }

    func dismiss(completion: (() -> Void)?) {
        dismissCompletionCallsCount += 1
        dismissCompletionReceivedCompletion = completion
    }
}
