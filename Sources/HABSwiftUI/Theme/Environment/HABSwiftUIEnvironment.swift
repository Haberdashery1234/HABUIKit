//
//  HABSwiftUIEnvironment.swift
//  HABDesignSystem
//
//  Created by Christian Grise on 7/17/26.
//

import SwiftUI
import HABFoundation

// MARK: - Theme Box

/// Equatable wrapper so SwiftUI can detect theme changes in the environment.
/// Equality is based on theme name — a different name means a different theme.
private struct HABThemeBox: Equatable {
    var theme: any HABTheme
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.theme.name == rhs.theme.name
    }
}

// MARK: - Environment Key

private struct HABThemeEnvironmentKey: EnvironmentKey {
    static var defaultValue: HABThemeBox {
        HABThemeBox(theme: HABThemeManager.shared.theme)
    }
}

// MARK: - EnvironmentValues Extension

public extension EnvironmentValues {
    /// The active HABDesignSystem theme for this environment.
    ///
    /// Access this property using the `@Environment` property wrapper:
    ///
    /// ```swift
    /// @Environment(\.habTheme) var theme
    ///
    /// var body: some View {
    ///     VStack {
    ///         Text("Title")
    ///             .foregroundStyle(theme.swiftUIColors.foreground)
    ///         Text("Subtitle")
    ///             .foregroundStyle(theme.swiftUIColors.foregroundSecondary)
    ///     }
    ///     .background(theme.swiftUIColors.background)
    /// }
    /// ```
    ///
    /// By default, this property returns `HABThemeManager.shared.theme`.
    /// Use the `.habTheme(_:)` view modifier to inject a custom theme into the environment.
    var habTheme: any HABTheme {
        get { self[HABThemeEnvironmentKey.self].theme }
        set { self[HABThemeEnvironmentKey.self] = HABThemeBox(theme: newValue) }
    }
}

// MARK: - View Modifier

public extension View {
    /// Injects a custom theme into the SwiftUI environment.
    ///
    /// Use this modifier to override the default theme for a specific view hierarchy:
    ///
    /// ```swift
    /// ContentView()
    ///     .habTheme(MyCustomTheme())
    /// ```
    ///
    /// All descendant views that read `@Environment(\.habTheme)` will receive
    /// the injected theme instead of the default from `HABThemeManager.shared`.
    ///
    /// - Parameter theme: The theme to inject into the environment.
    /// - Returns: A view with the specified theme in its environment.
    func habTheme(_ theme: any HABTheme) -> some View {
        environment(\.habTheme, theme)
    }
}
