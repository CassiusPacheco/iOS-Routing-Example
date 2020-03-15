//
//  PopUpViewModel.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 8/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import Foundation

protocol PopUpViewModelInterface {
    var message: String { get }

    func dismissButtonTouchUpInside()
}

final class PopUpViewModel: PopUpViewModelInterface {
    typealias Routes = Closable
    private let router: Routes
    let message: String

    init(message: String, router: Routes) {
        self.message = message
        self.router = router
    }

    func dismissButtonTouchUpInside() {
        print("Dismiss Button pressed")
        router.close()
    }
}
