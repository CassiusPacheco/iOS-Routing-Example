//
//  DependencyGraph.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 11/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation
import DependencyInjector

final class DependencyGraph {
    let container = DependencyInjector()

    func registerDependencies() {
        setupViewModels()
    }

    private func setupViewModels() {
        container.register(LoginViewModelInterface.self) { (_, routes: LoginViewModel.Routes) in
            return LoginViewModel(router: routes)
        }

        container.register(ForgottenPasswordViewModelInterface.self) { (_, routes: ForgottenPasswordViewModel.Routes) in
            return ForgottenPasswordViewModel(router: routes)
        }

        container.register(SignUpViewModelInterface.self) { (_, routes: SignUpViewModel.Routes) in
            return SignUpViewModel(router: routes)
        }
        
        container.register(PopUpViewModelInterface.self) { (_, message: String, routes: PopUpViewModel.Routes) in
            return PopUpViewModel(message: message, router: routes)
        }

        container.register(ProductViewModelInterface.self) { (_, routes: ProductViewModel.Routes) in
            return ProductViewModel(router: routes)
        }

        container.register(ShopViewModelInterface.self) { (_, routes: ShopViewModel.Routes) in
            return ShopViewModel(router: routes)
        }

        container.register(WishlistViewModelInterface.self) { (_, routes: WishlistViewModel.Routes) in
            return WishlistViewModel(router: routes)
        }
    }
}
