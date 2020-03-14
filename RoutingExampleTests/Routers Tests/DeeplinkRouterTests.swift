//
//  DeeplinkRouterTests.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import XCTest
import DependencyContainer
@testable import RoutingExample

final class DeeplinkRouterTests: XCTestCase {
    let root = ViewControllerMock()

    // MARK: - AppRoutes tests

    func testProductRoute() {
        XCTAssertEqual(AppRoutes(url: URL(string: "www.routing.com/product?something=meh")!), AppRoutes.product)
    }

    func testLoginRoute() {
        XCTAssertEqual(AppRoutes(url: URL(string: "www.routing.com/login?something=meh")!), AppRoutes.login)
    }

    func testSignUpRoute() {
        XCTAssertEqual(AppRoutes(url: URL(string: "www.routing.com/sign-up?something=meh")!), AppRoutes.signUp)
    }

    func testWishlistUpRoute() {
        XCTAssertEqual(AppRoutes(url: URL(string: "www.routing.com/wishlist?something=meh")!), AppRoutes.wishlist)
    }

    func testShopUpRoute() {
        XCTAssertEqual(AppRoutes(url: URL(string: "www.routing.com/shop?something=meh")!), AppRoutes.shop)
    }

    func testInvalidRoute() {
        XCTAssertNil(AppRoutes(url: URL(string: "www.routing.com")!))
    }
}

extension DeeplinkRouterTests {
    // MARK: - Route to url tests

    func testProductDeeplinkRoute() {
        let transition = TransitionMock()
        let router = DeeplinkRouter.makeDeeplink()
        router.root = root

        let result = router.route(to: URL(string: "www.routing.com/product?something=meh")!, as: transition)

        XCTAssertTrue(result)
        XCTAssertEqual(transition.openViewControllerCallsCount, 1)
        XCTAssertTrue(transition.openViewControllerReceivedVC is ProductViewController)
        XCTAssertTrue(transition.openViewControllerReceivedFromVC === root)
        XCTAssertNil(transition.openViewControllerReceivedCompletion)
    }

    func testLoginDeeplinkRoute() {
        let transition = TransitionMock()
        let router = DeeplinkRouter.makeDeeplink()
        router.root = root

        let result = router.route(to: URL(string: "www.routing.com/login?something=meh")!, as: transition)

        XCTAssertTrue(result)
        XCTAssertEqual(transition.openViewControllerCallsCount, 1)
        XCTAssertTrue(transition.openViewControllerReceivedVC?.asNavigationsRootVC() is LoginViewController)
        XCTAssertTrue(transition.openViewControllerReceivedFromVC === root)
        XCTAssertNil(transition.openViewControllerReceivedCompletion)
    }

    func testSignUpDeeplinkRoute() {
        let transition = TransitionMock()
        let router = DeeplinkRouter.makeDeeplink()
        router.root = root

        let result = router.route(to: URL(string: "www.routing.com/sign-up?something=meh")!, as: transition)

        XCTAssertTrue(result)
        XCTAssertEqual(transition.openViewControllerCallsCount, 1)
        XCTAssertTrue(transition.openViewControllerReceivedVC is SignUpViewController)
        XCTAssertTrue(transition.openViewControllerReceivedFromVC === root)
        XCTAssertNil(transition.openViewControllerReceivedCompletion)
    }

    func testWishlistDeeplinkRoute() {
        let tabbar = UITabBarController()
        tabbar.viewControllers = [UIViewController(), UIViewController(), UIViewController()]
        root.underlyingTabBarController = tabbar
        tabbar.selectedIndex = 2

        let transition = TransitionMock()
        let router = DeeplinkRouter.makeDeeplink()
        router.root = root

        let result = router.route(to: URL(string: "www.routing.com/wishlist?something=meh")!, as: transition)

        XCTAssertTrue(result)
        XCTAssertEqual(transition.openViewControllerCallsCount, 0, "Nothing was opened")
        XCTAssertEqual(root.tabBarController?.selectedIndex, 1, "Wishlist is the index 1")
    }

    func testShopDeeplinkRoute() {
        let tabbar = UITabBarController()
        tabbar.viewControllers = [UIViewController(), UIViewController(), UIViewController()]
        root.underlyingTabBarController = tabbar
        tabbar.selectedIndex = 2

        let transition = TransitionMock()
        let router = DeeplinkRouter.makeDeeplink()
        router.root = root

        let result = router.route(to: URL(string: "www.routing.com/shop?something=meh")!, as: transition)

        XCTAssertTrue(result)
        XCTAssertEqual(transition.openViewControllerCallsCount, 0, "Nothing was opened")
        XCTAssertEqual(root.tabBarController?.selectedIndex, 0, "Shop is the index 0")
    }

    func testInvalidDeeplinkRoute() {
        let tabbar = UITabBarController()
        tabbar.viewControllers = [UIViewController(), UIViewController(), UIViewController()]
        root.underlyingTabBarController = tabbar
        tabbar.selectedIndex = 2

        let transition = TransitionMock()
        let router = DeeplinkRouter.makeDeeplink()
        router.root = root

        let result = router.route(to: URL(string: "www.routing.com")!, as: transition)

        XCTAssertFalse(result)
    }
}

extension DeeplinkRouter {
    /// Helper method that injects mocked value by default.
    static func makeDeeplink(rootTransition: Transition = TransitionMock(),
                     container: DependencyContainer = DependencyContainer.mock()) -> DeeplinkRouter {
        return DeeplinkRouter(rootTransition: rootTransition, container: container)
    }
}
