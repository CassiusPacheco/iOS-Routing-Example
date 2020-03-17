//
//  ProductViewController.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 7/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit
import IntentsUI

final class ProductViewController: UIViewController {
    private let viewModel: ProductViewModelInterface

    init(viewModel: ProductViewModelInterface) {
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

        let wishlistButton = DefaultButton(title: "Add to Wishlist", target: self, selector: #selector(wishlistButtonTouchUpInside))
        let productButton = DefaultButton(title: "Open another Product", target: self, selector: #selector(productButtonTouchUpInside))

        let vStack = UIStackView(arrangedSubviews: [wishlistButton, productButton])
        vStack.axis = .vertical
        vStack.spacing = 8.0

        view.addSubview(vStack)
        vStack.layout.center(in: view)
        createAddToSiriButton()
    }

    private func createAddToSiriButton() {
        // Note that this is a useless intent. The idea is just to show the concept working.
        let intent = AddToWishlistIntent()
        intent.name = "Test"
        let shortcutButton = INUIAddVoiceShortcutButton(style: .whiteOutline)
        shortcutButton.shortcut = INShortcut(intent: intent)
        shortcutButton.delegate = viewModel.siriButtonDelegate

        navigationItem.setRightBarButton(UIBarButtonItem(customView: shortcutButton), animated: true)
    }

    @objc
    private func productButtonTouchUpInside() {
        viewModel.productButtonTouchUpInside()
    }

    @objc
    private func wishlistButtonTouchUpInside() {
        viewModel.wishlistButtonTouchUpInside()
    }

    deinit {
        print("♻️ \(self) Deallocated")
    }
}
