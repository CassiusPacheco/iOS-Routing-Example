//
//  EmptyTransition.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 8/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit

final class EmptyTransition {
    var isAnimated: Bool = true
}

extension EmptyTransition: Transition {
    // MARK: - Transition

    func open(_ viewController: UIViewController, from: UIViewController, completion: (() -> Void)?) {}
    func close(_ viewController: UIViewController, completion: (() -> Void)?) {}
}
