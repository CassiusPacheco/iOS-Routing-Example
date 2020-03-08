//
//  SceneDelegate.swift
//  RoutingExample
//
//  Created by Cassius Pacheco on 7/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private var deeplinkRouter: Router?
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let mainRouter = DefaultRouter(rootTransition: EmptyTransition())
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
            let router = DeeplinkRouter(rootTransition: transition)
            router.root = self.window?.topMostViewController()
            router.route(to: url, as: transition)
            self.deeplinkRouter = router
        }
    }
}
