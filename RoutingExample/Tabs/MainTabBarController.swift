//
//  MainTabBarController.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 7/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit

enum Tabs {
    case shop
    case wishlist

    var index: Int {
        switch self {
        case .shop:
            return 0
        case .wishlist:
            return 1
        }
    }

    var item: UITabBarItem {
        switch self {
        case .shop:
            return UITabBarItem(title: "Shop", image: nil, tag: index)
        case .wishlist:
            return UITabBarItem(title: "Wishlist", image: nil, tag: index)
        }
    }
}

final class MainTabBarController: UITabBarController {
    required init(viewControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = viewControllers
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
