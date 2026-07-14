//
//  SceneDelegate.swift
//  HABUIKitSample
//
//  Created by Christian Grise on 6/29/26.
//

import UIKit
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
        let catalog = CatalogViewController()
        let nav = SampleNavigationController(rootViewController: catalog)
        nav.navigationBar.prefersLargeTitles = true
        window.rootViewController = nav
        self.window = window
        window.makeKeyAndVisible()
    }
}
