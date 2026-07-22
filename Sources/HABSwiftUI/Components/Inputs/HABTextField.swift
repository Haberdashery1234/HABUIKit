//
//  HABTextField.swift
//  HABDesignSystem
//
//  Created by Christian Grise on 7/21/26.
//

import HABFoundation
import SwiftUI

public struct HABTextField: View {
    public enum Style {
        case outlined
        case filled
    }

    // MARK: - Properties

    let style: Style
    @Binding var text: String
    let placeholder: String
    let topLabel: String?
    let helperText: String?
    let errorText: String?
    let leadingIcon: Image?
    let trailingIcon: Image?
    let trailingAction: (() -> Void)?
    let isSecure: Bool

    // MARK: - Private State

    @FocusState private var isFocused: Bool
    @Environment(\.isEnabled) private var isEnabled: Bool

    // MARK: - Init

    public init(
        style: Style = .outlined,
        text: Binding<String>,
        placeholder: String,
        topLabel: String? = nil,
        helperText: String? = nil,
        errorText: String? = nil,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        trailingAction: (() -> Void)? = nil,
        isSecure: Bool = false
    ) {
        self.style = style
        self._text = text
        self.placeholder = placeholder
        self.topLabel = topLabel
        self.helperText = helperText
        self.errorText = errorText
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.trailingAction = trailingAction
        self.isSecure = isSecure
    }

    // MARK: - Body

    public var body: some View {
        let theme = HABThemeManager.shared.theme
        VStack(alignment: .leading, spacing: HABSpacing.xs) {
            if let topLabel {
                Text(topLabel)
                    .font(Font(theme.typography.footnote.font))
                    .foregroundStyle(theme.swiftUIColors.foregroundSecondary)
            }
            HStack {
                if let leadingIcon {
                    leadingIcon
                }
                if isSecure {
                    SecureField(placeholder, text: $text)
                        .focused($isFocused)
                } else {
                    TextField(placeholder, text: $text)
                        .focused($isFocused)
                }
                if let trailingIcon {
                    Button {
                        trailingAction?()
                    } label: {
                        trailingIcon
                    }
                }
            }
            .padding(.horizontal, HABSpacing.sm)
            .frame(height: 48)
            .background(containerBackground(theme: theme))
            .overlay(RoundedRectangle(cornerRadius: HABRadius.sm).stroke(borderColor(theme: theme), lineWidth: 1))

            if let errorText {
                Text(errorText)
                    .foregroundStyle(theme.swiftUIColors.destructive)
                    .font(Font(theme.typography.caption1.font))
            } else if let helperText {
                Text(helperText)
                    .foregroundStyle(theme.swiftUIColors.foregroundSecondary)
                    .font(Font(theme.typography.caption1.font))
            }
        }
        .opacity(isEnabled ? 1.0 : 0.4)
    }

    // MARK: - Private Helpers

    private func borderColor(theme: any HABTheme) -> Color {
        if errorText != nil {
            return theme.swiftUIColors.destructive
        } else if isFocused {
            return theme.swiftUIColors.primary
        } else {
            return theme.swiftUIColors.border
        }
    }

    private func containerBackground(theme: any HABTheme) -> Color {
        switch style {
            case .outlined: return .clear
            case .filled:   return theme.swiftUIColors.surface
        }
    }
}
