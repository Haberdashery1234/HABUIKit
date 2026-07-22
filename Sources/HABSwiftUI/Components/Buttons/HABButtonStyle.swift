//
//  HABButtonStyle.swift
//  HABDesignSystem
//
//  Created by Christian Grise on 7/21/26.
//

import HABFoundation
import SwiftUI

// MARK: - HABButtonStyle: ButtonStyle

/// A SwiftUI `ButtonStyle` that applies HABDesignSystem button styling.
///
/// ```swift
/// Button("Sign In") { }
///     .buttonStyle(HABButtonStyle(style: .primary))
/// // or via the convenience extension:
/// Button("Sign In") { }
///     .buttonStyle(.habPrimary)
/// ```
public struct HABButtonStyle: ButtonStyle {
    // MARK: - Style

    /// The visual variant of the button, controlling color and border treatment.
    public enum Style {
        /// Filled primary-color background. Use for the main CTA on a screen.
        case primary
        /// Transparent background with a primary-color border and label.
        case secondary
        /// No background or border, primary-color label only.
        case ghost
        /// Filled destructive-color background. Use for delete and irreversible actions.
        case destructive
    }

    // MARK: - Size

    /// The size of the button, controlling padding and label font.
    public enum Size {
        case small
        case medium
        case large
    }

    // MARK: - Properties

    let style: Style
    let size: Size
    let isLoading: Bool

    // MARK: - Init

    /// Creates an `HABButtonStyle`.
    ///
    /// - Parameters:
    ///   - style: The visual variant. Defaults to `.primary`.
    ///   - size: The button size. Defaults to `.medium`.
    ///   - isLoading: When `true`, shows a spinner and blocks interaction. Defaults to `false`.
    public init(
        style: Style = .primary,
        size: Size = .medium,
        isLoading: Bool = false
    ) {
        self.style = style
        self.size = size
        self.isLoading = isLoading
    }

    // MARK: - ButtonStyle

    public func makeBody(configuration: Configuration) -> some View {
        HABButtonBody(
            configuration: configuration,
            style: style,
            size: size,
            isLoading: isLoading,
            theme: HABThemeManager.shared.theme
        )
    }
}

// MARK: - HABButtonBody

/// Private inner View that renders the button using the theme passed from HABButtonStyle.
///
/// The theme is a stored value — no global state, no environment reads.
/// To update the appearance when the theme changes, re-create the button using `.id(themeName)`.
private struct HABButtonBody: View {
    // MARK: - Environment

    @Environment(\.isEnabled) private var isEnabled: Bool

    // MARK: - Properties

    let configuration: ButtonStyleConfiguration
    let style: HABButtonStyle.Style
    let size: HABButtonStyle.Size
    let isLoading: Bool
    let theme: any HABTheme

    // MARK: - Body

    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
                    .tint(foregroundColor)
            } else {
                configuration.label
                    .font(Font(labelFont))
                    .foregroundStyle(foregroundColor)
            }
        }
        .padding(contentPadding)
        .background(backgroundColor)
        .clipShape(Capsule())
        .overlay {
            if style == .secondary {
                Capsule()
                    .stroke(theme.swiftUIColors.primary, lineWidth: 1.5)
            }
        }
        .opacity(resolvedOpacity)
        .allowsHitTesting(!isLoading)
        .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }

    // MARK: - Private Helpers

    private var foregroundColor: Color {
        switch style {
            case .primary:     return theme.swiftUIColors.onPrimary
            case .destructive: return .white
            case .ghost:       return theme.swiftUIColors.primary
            case .secondary:   return theme.swiftUIColors.primary
        }
    }
    
    private var backgroundColor: Color {
        switch style {
            case .primary:     return theme.swiftUIColors.primary
            case .destructive: return theme.swiftUIColors.destructive
            case .ghost:       return .clear
            case .secondary:   return .clear
        }
    }
    
    private var contentPadding: EdgeInsets {
        switch size {
            case .small:  return EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12)
            case .medium: return EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20)
            case .large:  return EdgeInsets(top: 16, leading: 28, bottom: 16, trailing: 28)
        }
    }

    private var labelFont: UIFont {
        switch size {
            case .small:  return theme.typography.caption1.font
            case .medium: return theme.typography.body.font
            case .large:  return theme.typography.headline.font
        }
    }

    private var resolvedOpacity: Double {
        if isLoading { return 1.0 }
        if !isEnabled { return 0.4 }
        if configuration.isPressed { return 0.7 }
        return 1.0
    }
}

// MARK: - ButtonStyle Convenience Extensions

extension ButtonStyle where Self == HABButtonStyle {
    /// Primary filled button at the default medium size using the current shared theme.
    static var habPrimary: HABButtonStyle { .init(style: .primary) }

    /// Secondary outlined button at the default medium size.
    static var habSecondary: HABButtonStyle { .init(style: .secondary) }

    /// Ghost (no background or border) button at the default medium size.
    static var habGhost: HABButtonStyle { .init(style: .ghost) }

    /// Destructive filled button at the default medium size.
    static var habDestructive: HABButtonStyle { .init(style: .destructive) }

    /// Fully configured HABDesignSystem button style.
    static func hab(
        _ style: HABButtonStyle.Style,
        size: HABButtonStyle.Size = .medium,
        isLoading: Bool = false
    ) -> HABButtonStyle {
        .init(style: style, size: size, isLoading: isLoading)
    }
}
