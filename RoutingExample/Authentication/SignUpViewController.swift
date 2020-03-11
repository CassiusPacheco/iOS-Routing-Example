//
//  SignUpViewController.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 7/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit

final class SignUpViewController: UIViewController {
    private let viewModel: SignUpViewModelInterface

    init(viewModel: SignUpViewModelInterface) {
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

        let vStack = UIStackView(arrangedSubviews: [dismissButton, forgottenPasswordButton])
        vStack.axis = .vertical
        vStack.spacing = 8.0

        view.addSubview(vStack)
        vStack.layout.center(in: view)
    }

    @objc
    private func forgottenPasswordButtonTouchUpInside() {
        print("Forgotten Password Button pressed")
        viewModel.forgottenPasswordButtonTouchUpInside()
    }

    @objc
    private func dismissButtonTouchUpInside() {
        print("Dismiss Button pressed")
        viewModel.dismissButtonTouchUpInside()
    }

    deinit {
        print("♻️ \(self) Deallocated")
    }
}
