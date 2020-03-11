//
//  WishlistViewController.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 7/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit

final class WishlistViewController: UIViewController {
    private let viewModel: WishlistViewModelInterface

    init(viewModel: WishlistViewModelInterface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Wishlist"

        let loginButton = DefaultButton(title: "Login", target: self, selector: #selector(loginButtonTouchUpInside))
        let productButton = DefaultButton(title: "Open a Product", target: self, selector: #selector(productButtonTouchUpInside))

        let vStack = UIStackView(arrangedSubviews: [loginButton, productButton])
        vStack.axis = .vertical
        vStack.spacing = 8.0

        view.addSubview(vStack)
        vStack.layout.center(in: view)
    }

    @objc
    private func productButtonTouchUpInside() {
        viewModel.productButtonTouchUpInside()
    }

    @objc
    private func loginButtonTouchUpInside() {
        viewModel.loginButtonTouchUpInside()
    }
}
