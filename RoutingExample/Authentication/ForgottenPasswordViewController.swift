//
//  ForgottenPasswordViewController.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 7/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit

final class ForgottenPasswordViewController: UIViewController {
    private let viewModel: ForgottenPasswordViewModel

    init(viewModel: ForgottenPasswordViewModel) {
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

        let resetPasswordButton = DefaultButton(title: "Reset password", target: self, selector: #selector(resetPasswordButtonTouchUpInside))
        view.addSubview(resetPasswordButton)
        resetPasswordButton.layout.center(in: view)
    }

    @objc
    private func resetPasswordButtonTouchUpInside() {
        viewModel.resetPasswordButtonTouchUpInside()
    }

    deinit {
        print("♻️ \(self) Deallocated")
    }
}
