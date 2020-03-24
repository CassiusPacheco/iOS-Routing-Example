//
//  DefaultRouterTests.swift
//  RoutingExampleTests
//
//  Created by Cassius Pacheco on 14/3/20.
//  Copyright © 2020 Cassius Pacheco. All rights reserved.
//

import XCTest
import DependencyContainer
@testable import RoutingExample

final class DefaultRouterTests: XCTestCase {
    let root = ViewControllerMock()

    // MARK: - Open methods

    func testRouteToNotOpeningAnythingWhenRootIsNil() {
        let transition = TransitionMock()
        let router = DefaultRouter.makeDefault()

        router.route(to: UIViewController(), as: transition)

        XCTAssertNil(router.root)
        XCTAssertEqual(transition.openViewControllerCallsCount, 0, "Nothing is opened if root is nil")
    }

    func testRouteToOpeningControllerWhenRootIsNotNil() {
        let transition = TransitionMock()
        let router = DefaultRouter.makeDefault()
        router.root = root

        let toBePresented = UIViewController()
        router.route(to: toBePresented, as: transition)

        XCTAssertNotNil(router.root)
        XCTAssertEqual(transition.openViewControllerCallsCount, 1)
        XCTAssertTrue(transition.openViewControllerReceivedVC === toBePresented)
        XCTAssertTrue(transition.openViewControllerReceivedFromVC === root)
    }

    func testRouteToCompletionNotOpeningAnythingWhenRootIsNil() {
        let transition = TransitionMock()
        let router = DefaultRouter.makeDefault()

        router.route(to: UIViewController(), as: transition, completion: { print("yay") })

        XCTAssertNil(router.root)
        XCTAssertEqual(transition.openViewControllerCallsCount, 0, "Nothing is opened if root is nil")
    }

    func testRouteToCompletionOpeningControllerWhenRootIsNotNil() {
        let transition = TransitionMock()
        let router = DefaultRouter.makeDefault()
        router.root = root


        let toBePresented = UIViewController()
        router.route(to: toBePresented, as: transition, completion: { print("yay") })

        XCTAssertNotNil(router.root)
        XCTAssertEqual(transition.openViewControllerCallsCount, 1)
        XCTAssertTrue(transition.openViewControllerReceivedVC === toBePresented)
        XCTAssertTrue(transition.openViewControllerReceivedFromVC === root)
        XCTAssertNotNil(transition.openViewControllerReceivedCompletion)
    }
}

extension DefaultRouterTests {
    // MARK: - Close methods

    func testCloseNotClosingAnythingWhenRootIsNil() {
        let transition = TransitionMock()
        let router = DefaultRouter.makeDefault(rootTransition: transition)

        router.close()

        XCTAssertNil(router.root)
        XCTAssertEqual(transition.closeViewControllerCallsCount, 0, "Nothing was closed if root is nil")
    }

    func testCloseClosesControllerWhenRootIsNotNil() {
        let transition = TransitionMock()
        let router = DefaultRouter.makeDefault(rootTransition: transition)
        router.root = root

        router.close()

        XCTAssertNotNil(router.root)
        XCTAssertEqual(transition.closeViewControllerCallsCount, 1)
        XCTAssertTrue(transition.closeViewControllerReceivedVC === root)
    }

    func testCloseCompletionNotClosingAnythingWhenRootIsNil() {
        let transition = TransitionMock()
        let router = DefaultRouter.makeDefault(rootTransition: transition)

        router.close(completion: { print("yay") })

        XCTAssertNil(router.root)
        XCTAssertEqual(transition.closeViewControllerCallsCount, 0, "Nothing was closed if root is nil")
    }

    func testCloseCompletionClosingControllerWhenRootIsNotNil() {
        let transition = TransitionMock()
        let router = DefaultRouter.makeDefault(rootTransition: transition)
        router.root = root

        router.close(completion: { print("yay") })

        XCTAssertNotNil(router.root)
        XCTAssertEqual(transition.closeViewControllerCallsCount, 1)
        XCTAssertTrue(transition.closeViewControllerReceivedVC === root)
        XCTAssertNotNil(transition.closeViewControllerReceivedCompletion)
    }
}

extension DefaultRouterTests {
    // MARK: - Dismiss methods

    func testDismissNotDismissingAnythingWhenRootIsNil() {
        let transition = TransitionMock()
        let router = DefaultRouter.makeDefault(rootTransition: transition)

        router.dismiss()

        XCTAssertNil(router.root)
        XCTAssertEqual(root.dismissWithAnimatedCalledCount, 0, "Nothing was closed if root is nil")
    }

    func testDismissClosesControllerWhenRootIsNotNil() {
        let transition = TransitionMock()
        let router = DefaultRouter.makeDefault(rootTransition: transition)
        router.root = root

        router.dismiss()

        XCTAssertNotNil(router.root)
        XCTAssertEqual(root.dismissWithAnimatedCalledCount, 1, "Dismiss calls the root's dismiss directly")
        XCTAssertEqual(root.dismissWithAnimatedArguments?.animated, transition.isAnimated)
        XCTAssertNil(root.dismissWithAnimatedArguments?.completion)
    }

    func testDismissCompletionNotDismissingAnythingWhenRootIsNil() {
        let transition = TransitionMock()
        let router = DefaultRouter.makeDefault(rootTransition: transition)

        router.dismiss(completion: { print("yay") })

        XCTAssertNil(router.root)
        XCTAssertEqual(root.dismissWithAnimatedCalledCount, 0, "Nothing was closed if root is nil")
    }

    func testDismissCompletionDismissingControllerWhenRootIsNotNil() {
        let transition = TransitionMock()
        let router = DefaultRouter.makeDefault(rootTransition: transition)
        router.root = root

        router.dismiss(completion: { print("yay") })

        XCTAssertNotNil(router.root)
        XCTAssertEqual(root.dismissWithAnimatedCalledCount, 1, "Dismiss calls the root's dismiss directly")
        XCTAssertEqual(root.dismissWithAnimatedArguments?.animated, transition.isAnimated)
        XCTAssertNotNil(root.dismissWithAnimatedArguments?.completion)
    }
}

extension DefaultRouter {
    /// Helper method that injects mocked value by default.
    static func makeDefault(rootTransition: Transition = TransitionMock(),
                     container: DependencyContainer = DependencyContainer.mock()) -> DefaultRouter {
        return DefaultRouter(rootTransition: rootTransition, container: container)
    }
}
