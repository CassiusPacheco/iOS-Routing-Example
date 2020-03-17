//
//  LoginViewController.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 7/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    private let viewModel: LoginViewModelInterface

    init(viewModel: LoginViewModelInterface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        print("👶 \(self) Created")

        let dismissButton = DefaultButton(title: "Dismiss", target: self, selector: #selector(dismissButtonTouchUpInside))
        let forgottenPasswordButton = DefaultButton(title: "Forgot Password", target: self, selector: #selector(forgottenPasswordButtonTouchUpInside))
        let signUpButton = DefaultButton(title: "Sign Up", target: self, selector: #selector(signUpButtonTouchUpInside))

        let vStack = UIStackView(arrangedSubviews: [dismissButton, forgottenPasswordButton, signUpButton])
        vStack.axis = .vertical
        vStack.spacing = 8.0

        view.addSubview(vStack)
        vStack.layout.center(in: view)
    }

    @objc
    private func dismissButtonTouchUpInside() {
        viewModel.dismissButtonTouchUpInside()
    }

    @objc
    private func forgottenPasswordButtonTouchUpInside() {
        viewModel.forgottenPasswordButtonTouchUpInside()
    }

    @objc
    private func signUpButtonTouchUpInside() {
        viewModel.signUpButtonTouchUpInside()
    }

    deinit {
        print("♻️ \(self) Deallocated")
    }
}
