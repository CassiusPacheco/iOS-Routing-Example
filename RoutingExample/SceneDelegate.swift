//
//  SceneDelegate.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 7/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit
import DependencyInjector

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // The Graph's container should register and resolve all dependencies of the app.
    // In order to do it the container must be passed down to every Router.
    // No other classes besides Routers should have access to it. Routers are the only
    // responsible for instantiating new screens and they are in charge of injecting
    // all necessary dependencies into them.
    private let dependencyGraph = DependencyGraph()
    private var deeplinkRouter: Router?
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        dependencyGraph.registerDependencies()

        let mainRouter = DefaultRouter(rootTransition: EmptyTransition(), container: dependencyGraph.container)
        let tabs = [mainRouter.makeShopTab(), mainRouter.makeWishlistTab()]

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = MainTabBarController(viewControllers: tabs)
        window?.makeKeyAndVisible()

        if let urlContext = connectionOptions.urlContexts.first {
            deeplink(urlContext.url)
        }
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let urlContext = URLContexts.first else { return }
        deeplink(urlContext.url)
    }

    private func deeplink(_ url: URL) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            // Define all deeplinks to be opened with a Modal Transition
            let transition = ModalTransition()
            let router = DeeplinkRouter(rootTransition: transition, container: self.dependencyGraph.container)
            router.root = self.window?.topMostViewController()
            router.route(to: url, as: transition)
            self.deeplinkRouter = router
        }
    }
}
