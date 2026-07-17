//
//  HABLightTheme.swift
//  HABUIKit
//
//  HABUIKit's curated light theme.
//
//  Palette concept: warm parchment backgrounds paired with Royal Blue
//  (65, 105, 225) as the primary action color. All values are
//  hardcoded — this theme does not shift with the system appearance.
//  Pair it with HABDarkTheme and switch at runtime to support a
//  manual light/dark toggle inside your app.
//

#if canImport(UIKit)
import UIKit

public struct HABLightTheme: HABTheme {
    public let name = "HABLight"

    public var colors: HABColorTokens {
        HABColorTokens(
            // ── Brand ──────────────────────────────────────────────────────
            primary: .hab(r: 65, g: 105, b: 225),       // Royal Blue
            secondary: .hab(r: 100, g: 149, b: 237),       // Cornflower Blue
            accent: .hab(r: 184, g: 145, b: 74),        // Antique Gold

            // ── Backgrounds ────────────────────────────────────────────────
            background: .hab(r: 250, g: 248, b: 240),       // Warm off-white
            backgroundSecondary: .hab(r: 241, g: 237, b: 224),       // Light parchment
            surface: .hab(r: 255, g: 253, b: 246),       // Near-white, warm tint
            surfaceElevated: .hab(r: 255, g: 255, b: 255),       // Pure white

            // ── Foreground ─────────────────────────────────────────────────
            foreground: .hab(r: 28, g: 25, b: 18),        // Warm near-black
            foregroundSecondary: .hab(r: 96, g: 88, b: 70),        // Medium warm brown
            foregroundTertiary: .hab(r: 148, g: 140, b: 120),       // Muted warm gray
            foregroundDisabled: .hab(r: 190, g: 184, b: 167),       // Very muted warm
            foregroundInverted: .hab(r: 255, g: 255, b: 255),       // White (on dark/brand surfaces)

            // ── On-brand ───────────────────────────────────────────────────
            onPrimary: .hab(r: 255, g: 255, b: 255),       // White on Royal Blue
            onSecondary: .hab(r: 255, g: 255, b: 255),       // White on Cornflower

            // ── Semantic states ────────────────────────────────────────────
            destructive: .hab(r: 192, g: 57, b: 43),        // Warm red
            destructiveSurface: .hab(r: 192, g: 57, b: 43, a: 0.12),
            success: .hab(r: 39, g: 160, b: 90),        // Medium green
            successSurface: .hab(r: 39, g: 160, b: 90, a: 0.12),
            warning: .hab(r: 214, g: 158, b: 46),        // Amber
            warningSurface: .hab(r: 214, g: 158, b: 46, a: 0.12),
            info: .hab(r: 65, g: 105, b: 225),       // Royal Blue (matches primary)
            infoSurface: .hab(r: 65, g: 105, b: 225, a: 0.12),

            // ── UI Chrome ──────────────────────────────────────────────────
            border: .hab(r: 205, g: 198, b: 180),       // Warm medium gray
            borderSubtle: .hab(r: 228, g: 223, b: 208),       // Very light warm gray
            overlay: .hab(r: 20, g: 16, b: 8, a: 0.4)// Warm black
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
#endif
