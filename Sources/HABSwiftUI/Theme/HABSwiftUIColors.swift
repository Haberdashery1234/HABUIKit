//
//  HABSwiftUIColors.swift
//  HABDesignSystem
//
//  Created by Christian Grise on 7/17/26.
//

import SwiftUI
import HABFoundation

/// SwiftUI-native color tokens bridged from HABColorTokens.
///
/// Access this via the `swiftUIColors` property on any `HABTheme`:
///
/// ```swift
/// @Environment(\.habTheme) var theme
///
/// var body: some View {
///     Text("Hello")
///         .foregroundStyle(theme.swiftUIColors.primary)
/// }
/// ```
public struct HABSwiftUIColors {
    // MARK: - Brand

    /// Primary brand color. Used for main CTAs, active states, and key interactive elements.
    public let primary: Color

    /// Secondary brand color. Used for supporting UI elements and secondary actions.
    public let secondary: Color

    /// Accent color. Used sparingly for highlights and emphasis.
    public let accent: Color

    // MARK: - Backgrounds

    /// Main app background. Maps to `UIColor.systemBackground` by default.
    public let background: Color

    /// Secondary background. Used for grouped content, sidebars, and inset sections.
    public let backgroundSecondary: Color

    /// Surface background. Used for cards and elevated containers at the first level.
    public let surface: Color

    /// Elevated surface background. Used for modals, sheets, and popovers.
    public let surfaceElevated: Color

    // MARK: - Foreground

    /// Primary text and icon color.
    public let foreground: Color

    /// Secondary text. Used for subtitles, metadata, and supporting copy.
    public let foregroundSecondary: Color

    /// Tertiary text. Used for hints, timestamps, and low-emphasis content.
    public let foregroundTertiary: Color

    /// Disabled text and icon color.
    public let foregroundDisabled: Color

    /// Inverted foreground. Used for text placed on dark or brand-colored surfaces.
    public let foregroundInverted: Color

    // MARK: - On-Brand

    /// Content color for elements placed on a `primary`-colored surface.
    public let onPrimary: Color

    /// Content color for elements placed on a `secondary`-colored surface.
    public let onSecondary: Color

    // MARK: - Semantic States

    /// Destructive action color. Used for delete, remove, and error states.
    public let destructive: Color

    /// Tinted background for destructive state containers and banners.
    public let destructiveSurface: Color

    /// Success state color.
    public let success: Color

    /// Tinted background for success state containers and banners.
    public let successSurface: Color

    /// Warning state color.
    public let warning: Color

    /// Tinted background for warning state containers and banners.
    public let warningSurface: Color

    /// Informational state color.
    public let info: Color

    /// Tinted background for info state containers and banners.
    public let infoSurface: Color

    // MARK: - UI Chrome

    /// Standard border and divider color.
    public let border: Color

    /// Subtle border. Used for low-emphasis separators and hairlines.
    public let borderSubtle: Color

    /// Overlay color for modal dimming backgrounds.
    public let overlay: Color

    // MARK: - Init

    /// Creates a SwiftUI color token set by bridging from UIKit color tokens.
    ///
    /// - Parameter tokens: The HABColorTokens instance to bridge from.
    init(tokens: HABColorTokens) {
        self.primary             = Color(uiColor: tokens.primary)
        self.secondary           = Color(uiColor: tokens.secondary)
        self.accent              = Color(uiColor: tokens.accent)
        self.background          = Color(uiColor: tokens.background)
        self.backgroundSecondary = Color(uiColor: tokens.backgroundSecondary)
        self.surface             = Color(uiColor: tokens.surface)
        self.surfaceElevated     = Color(uiColor: tokens.surfaceElevated)
        self.foreground          = Color(uiColor: tokens.foreground)
        self.foregroundSecondary = Color(uiColor: tokens.foregroundSecondary)
        self.foregroundTertiary  = Color(uiColor: tokens.foregroundTertiary)
        self.foregroundDisabled  = Color(uiColor: tokens.foregroundDisabled)
        self.foregroundInverted  = Color(uiColor: tokens.foregroundInverted)
        self.onPrimary           = Color(uiColor: tokens.onPrimary)
        self.onSecondary         = Color(uiColor: tokens.onSecondary)
        self.destructive         = Color(uiColor: tokens.destructive)
        self.destructiveSurface  = Color(uiColor: tokens.destructiveSurface)
        self.success             = Color(uiColor: tokens.success)
        self.successSurface      = Color(uiColor: tokens.successSurface)
        self.warning             = Color(uiColor: tokens.warning)
        self.warningSurface      = Color(uiColor: tokens.warningSurface)
        self.info                = Color(uiColor: tokens.info)
        self.infoSurface         = Color(uiColor: tokens.infoSurface)
        self.border              = Color(uiColor: tokens.border)
        self.borderSubtle        = Color(uiColor: tokens.borderSubtle)
        self.overlay             = Color(uiColor: tokens.overlay)
    }
}

// MARK: - HABTheme Extension

public extension HABTheme {
    /// SwiftUI-native color tokens for this theme.
    ///
    /// Use this property to access color tokens in SwiftUI views:
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
    var swiftUIColors: HABSwiftUIColors {
        HABSwiftUIColors(tokens: colors)
    }
}
