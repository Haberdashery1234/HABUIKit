//
//  SceneDelegate.swift
//  HABUIKitSample
//
//  Created by Christian Grise on 6/29/26.
//

import UIKit
import SwiftUI
import HABFoundation
import HABUIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = makeTabBarController()
        self.window = window
        window.makeKeyAndVisible()
    }

    private func makeTabBarController() -> UITabBarController {
        let tabs = UITabBarController()

        let catalog = CatalogViewController()
        let uiKitNav = SampleNavigationController(rootViewController: catalog)
        uiKitNav.navigationBar.prefersLargeTitles = true
        uiKitNav.tabBarItem = UITabBarItem(
            title: "UIKit",
            image: UIImage(systemName: "rectangle.stack"),
            selectedImage: UIImage(systemName: "rectangle.stack.fill")
        )

        let swiftUIHost = UIHostingController(rootView: HABSwiftUICatalogView())
        swiftUIHost.tabBarItem = UITabBarItem(
            title: "SwiftUI",
            image: UIImage(systemName: "swift"),
            selectedImage: UIImage(systemName: "swift")
        )

        tabs.viewControllers = [uiKitNav, swiftUIHost]
        return tabs
    }
}
