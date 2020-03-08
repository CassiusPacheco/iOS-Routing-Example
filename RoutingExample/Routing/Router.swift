//
//  Router.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 5/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit

protocol Closable: class {
    /// Closes the Router's root view controller using the transition used to show it.
    func close()

    /// Closes the Router's root view controller using the transition used to show it.
    func close(completion: (() -> Void)?)
}

protocol Dismissable: class {
    /// Dismisses the Router's root view controller ignoring the transition used to show it.
    func dismiss()

    /// Dismisses the Router's root view controller ignoring the transition used to show it.
    func dismiss(completion: (() -> Void)?)
}

protocol Deeplinkable: class {
    /// Route to a view controller applying the transition provided by resolving the URL to a specific Route.
    @discardableResult
    func route(to url: URL, as transition: Transition) -> Bool
}

protocol Routable: class {
    /// Route to a view controller using the transition provided.
    func route(to viewController: UIViewController, as transition: Transition)

    /// Route to  a view controller using the transition provided.
    func route(to viewController: UIViewController, as transition: Transition, completion: (() -> Void)?)
}

protocol Router: Routable {
    /// The root view controller of this router.
    var root: UIViewController? { get set }

    // Depending on the App's architecture it may be better to expose
    // a way of accessing dependencies in the Routers through a DI Container,
    // or something similar, in order to ensure the controllers and
    // view models instantiated by this class become testable.
    //
    // Dependency Container example:
    // https://github.com/CassiusPacheco/DependencyContainer
    //
    // var container: DependencyContainer { get }
}
