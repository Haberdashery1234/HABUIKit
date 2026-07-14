//
//  HABDarkTheme.swift
//  HABUIKit
//
//  HABUIKit's curated dark theme.
//
//  Palette concept: deep navy backgrounds (echoing the Royal Blue
//  family), a slightly brightened primary for contrast on dark
//  surfaces, and parchment-tinted foreground colors so text retains
//  warmth rather than going cold white.
//
//  All values are hardcoded — this theme does not shift with the
//  system appearance. Set it explicitly when you want a forced dark
//  experience, or swap from HABLightTheme in response to a user toggle.
//

import UIKit

public struct HABDarkTheme: HABTheme {
    public let name = "HABDark"

    public var colors: HABColorTokens {
        HABColorTokens(
            // ── Brand ──────────────────────────────────────────────────────
            primary: .hab(r: 90, g: 130, b: 240),       // Brightened Royal Blue (dark-mode contrast)
            secondary: .hab(r: 120, g: 160, b: 245),       // Light Cornflower
            accent: .hab(r: 212, g: 175, b: 96),        // Brighter Antique Gold

            // ── Backgrounds ────────────────────────────────────────────────
            background: .hab(r: 12, g: 15, b: 24),        // Deep navy
            backgroundSecondary: .hab(r: 20, g: 24, b: 38),        // Dark navy
            surface: .hab(r: 26, g: 31, b: 48),        // Navy surface
            surfaceElevated: .hab(r: 36, g: 42, b: 64),        // Lighter navy

            // ── Foreground ─────────────────────────────────────────────────
            foreground: .hab(r: 242, g: 240, b: 232),       // Parchment white
            foregroundSecondary: .hab(r: 180, g: 174, b: 156),       // Muted parchment
            foregroundTertiary: .hab(r: 120, g: 114, b: 98),        // Darker muted
            foregroundDisabled: .hab(r: 75, g: 70, b: 58),        // Very muted
            foregroundInverted: .hab(r: 28, g: 25, b: 18),        // Warm dark (text on light surfaces)

            // ── On-brand ───────────────────────────────────────────────────
            onPrimary: .hab(r: 255, g: 255, b: 255),       // White on brightened Blue
            onSecondary: .hab(r: 255, g: 255, b: 255),

            // ── Semantic states ────────────────────────────────────────────
            destructive: .hab(r: 231, g: 76, b: 60),        // Bright red
            destructiveSurface: .hab(r: 231, g: 76, b: 60, a: 0.15),
            success: .hab(r: 46, g: 204, b: 113),       // Bright green
            successSurface: .hab(r: 46, g: 204, b: 113, a: 0.15),
            warning: .hab(r: 241, g: 196, b: 15),        // Bright amber
            warningSurface: .hab(r: 241, g: 196, b: 15, a: 0.15),
            info: .hab(r: 90, g: 130, b: 240),       // Matches primary
            infoSurface: .hab(r: 90, g: 130, b: 240, a: 0.15),

            // ── UI Chrome ──────────────────────────────────────────────────
            border: .hab(r: 50, g: 56, b: 80),        // Dark navy border
            borderSubtle: .hab(r: 35, g: 40, b: 60),        // Darker border
            overlay: .hab(r: 0, g: 0, b: 0, a: 0.6)// Deeper overlay on dark
        )
    }

    public var typography: HABTypographyTokens { HABTypographyTokens() }

    public init() {}
}

// MARK: - Private color helper

private extension UIColor {
    /// Convenience init using 0–255 integer components.
    static func hab(r: Int, g: Int, b: Int, a: CGFloat = 1) -> UIColor {
        UIColor(
            red: CGFloat(r) / 255,
            green: CGFloat(g) / 255,
            blue: CGFloat(b) / 255,
            alpha: a
        )
    }
}
