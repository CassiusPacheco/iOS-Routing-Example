//
//  DependencyContainerMock.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation
import DependencyContainer
@testable import RoutingExample

extension DependencyContainer {
    static func mock() -> DependencyContainer {
        // Register all interfaces registered in the DependencyGraph.swift with their
        // respective Mock classes. This will allow us to control the entire app flow
        // with fake data and validate assumptions.
        let container = DependencyContainer()

        // Note that's important to keep the same arguments signature here, even
        // though they're not being used by the Mock class, because the DependencyContainer
        // framework needs them to resolve the dependencies correctly.
        container.register(LoginViewModelInterface.self) { (_, routes: LoginViewModel.Routes) in
            return LoginViewModelMock()
        }

        container.register(ForgottenPasswordViewModelInterface.self) { (_, routes: ForgottenPasswordViewModel.Routes) in
            return ForgottenPasswordViewModelMock()
        }

        container.register(SignUpViewModelInterface.self) { (_, routes: SignUpViewModel.Routes) in
            return SignUpViewModelMock()
        }

        container.register(PopUpViewModelInterface.self) { (_, message: String, routes: PopUpViewModel.Routes) in
            return PopUpViewModelMock()
        }

        container.register(ProductViewModelInterface.self) { (_, routes: ProductViewModel.Routes) in
            return ProductViewModelMock()
        }

        container.register(ShopViewModelInterface.self) { (_, routes: ShopViewModel.Routes) in
            return ShopViewModelMock()
        }

        container.register(WishlistViewModelInterface.self) { (_, routes: WishlistViewModel.Routes) in
            return WishlistViewModelMock()
        }

        return container
    }
}
