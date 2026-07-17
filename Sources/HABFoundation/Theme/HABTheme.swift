//
//  HABTheme.swift
//  HABUIKit
//
//  Created by Christian Grise on 6/29/26.
//

#if canImport(UIKit)
import UIKit

/// Defines the visual identity of an app using HABUIKit.
///
/// Conform to this protocol to create a custom theme. Set it on
/// `HABThemeManager.shared.theme` at launch to brand the entire app.
///
/// ```swift
/// struct MyAppTheme: HABTheme {
///     let name = "MyApp"
///
///     var colors: HABColorTokens {
///         var tokens = HABColorTokens()
///         tokens.primary = UIColor(named: "BrandBlue")!
///         tokens.accent  = UIColor(named: "BrandGold")!
///         return tokens
///     }
///
///     var typography: HABTypographyTokens {
///         HABTypographyTokens()
///     }
/// }
///
/// // In AppDelegate or App entry point:
/// HABThemeManager.shared.theme = MyAppTheme()
/// ```
public protocol HABTheme {
    /// A human-readable name for this theme. Used for debugging and logging.
    var name: String { get }

    /// The semantic color tokens for this theme.
    var colors: HABColorTokens { get }

    /// The typography token set for this theme.
    var typography: HABTypographyTokens { get }
}
#endif
