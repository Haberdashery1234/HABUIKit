//
//  HABThemeManager.swift
//  HABUIKit
//
//  Created by Christian Grise on 6/29/26.
//

import UIKit

/// Manages the active HABUIKit theme for the app.
///
/// Set a theme once at launch and all HABUIKit components will reflect it.
/// Swapping the theme at runtime triggers a notification that base view
/// controllers observe automatically, causing the UI to update.
///
/// ```swift
/// // AppDelegate.application(_:didFinishLaunchingWithOptions:)
/// HABThemeManager.shared.theme = MyAppTheme()
/// ```
public final class HABThemeManager {
    // MARK: - Shared Instance

    /// The shared theme manager. Use this to get and set the active theme.
    public static let shared = HABThemeManager()

    private init() {}

    // MARK: - Theme

    /// The currently active theme.
    ///
    /// Setting this property broadcasts `themeDidChangeNotification` so all
    /// subscribed components can update their appearance.
    public var theme: any HABTheme = HABDefaultTheme() {
        didSet {
            NotificationCenter.default.post(
                name: HABThemeManager.themeDidChangeNotification,
                object: self,
                userInfo: [HABThemeManager.themeNameKey: theme.name]
            )
        }
    }

    // MARK: - Notifications

    /// Posted on `NotificationCenter.default` whenever the active theme changes.
    ///
    /// Subscribe to this notification in any view or view controller that needs
    /// to update its appearance when the theme is swapped.
    ///
    /// `HABBaseViewController` and its subclasses subscribe automatically.
    ///
    /// ```swift
    /// NotificationCenter.default.addObserver(
    ///     self,
    ///     selector: #selector(themeDidChange),
    ///     name: HABThemeManager.themeDidChangeNotification,
    ///     object: nil
    /// )
    /// ```
    public static let themeDidChangeNotification = Notification.Name("HABThemeManagerThemeDidChange")

    /// The `userInfo` key for the incoming theme's `name` string.
    public static let themeNameKey = "HABThemeManagerThemeNameKey"
}
