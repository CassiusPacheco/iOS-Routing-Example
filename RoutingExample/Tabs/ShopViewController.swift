//
//  ShopViewController.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 7/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit

final class ShopViewController: UIViewController {
    private let viewModel: ShopViewModel

    init(viewModel: ShopViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Shop"

        let productButton = DefaultButton(title: "Open a Product", target: self, selector: #selector(productButtonTouchUpInside))
        view.addSubview(productButton)
        productButton.layout.center(in: view)
    }

    @objc
    private func productButtonTouchUpInside() {
        viewModel.productButtonTouchUpInside()
    }
}
