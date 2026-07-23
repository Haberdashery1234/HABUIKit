//
//  HABSwiftUIFonts.swift
//  HABDesignSystem
//
//  Created by Christian Grise on 7/23/26.
//

import SwiftUI
import HABFoundation

/// SwiftUI-native font tokens bridged from HABTypographyTokens.
///
/// Access this via the `swiftUIFonts` property on any `HABTheme`:
///
/// ```swift
/// let fonts = HABThemeManager.shared.theme.swiftUIFonts
///
/// Text("Hello").font(fonts.body)
/// Text("Title").font(fonts.title1)
/// ```
public struct HABSwiftUIFonts {
    // MARK: - Display & Titles

    /// Extra-large hero text.
    public let display: Font

    /// Large title. Matches `UIFont.TextStyle.largeTitle`.
    public let largeTitle: Font

    /// Title level 1.
    public let title1: Font

    /// Title level 2.
    public let title2: Font

    /// Title level 3.
    public let title3: Font

    // MARK: - Body

    /// Headline. Semibold body-level text.
    public let headline: Font

    /// Body. Default reading size.
    public let body: Font

    /// Callout.
    public let callout: Font

    /// Subheadline.
    public let subheadline: Font

    // MARK: - Small

    /// Footnote.
    public let footnote: Font

    /// Caption level 1.
    public let caption1: Font

    /// Caption level 2.
    public let caption2: Font

    // MARK: - Init

    /// Creates a SwiftUI font token set by bridging from UIKit typography tokens.
    ///
    /// - Parameter tokens: The `HABTypographyTokens` instance to bridge from.
    init(tokens: HABTypographyTokens) {
        self.display      = Font(tokens.display.font)
        self.largeTitle   = Font(tokens.largeTitle.font)
        self.title1       = Font(tokens.title1.font)
        self.title2       = Font(tokens.title2.font)
        self.title3       = Font(tokens.title3.font)
        self.headline     = Font(tokens.headline.font)
        self.body         = Font(tokens.body.font)
        self.callout      = Font(tokens.callout.font)
        self.subheadline  = Font(tokens.subheadline.font)
        self.footnote     = Font(tokens.footnote.font)
        self.caption1     = Font(tokens.caption1.font)
        self.caption2     = Font(tokens.caption2.font)
    }
}

// MARK: - HABTheme Extension

public extension HABTheme {
    /// SwiftUI-native font tokens for this theme.
    ///
    /// ```swift
    /// let fonts = HABThemeManager.shared.theme.swiftUIFonts
    ///
    /// Text("Headline").font(fonts.headline)
    /// Text("Body copy").font(fonts.body)
    /// ```
    var swiftUIFonts: HABSwiftUIFonts {
        HABSwiftUIFonts(tokens: typography)
    }
}
