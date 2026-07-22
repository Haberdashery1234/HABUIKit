//
//  HABSwiftUIThemeSwitcherView.swift
//  HABDesignSystemSample
//
//  Created by Christian Grise on 7/21/26.
//

import SwiftUI
import HABFoundation

struct HABSwiftUIThemeSwitcherView: View {

    // MARK: - Types

    private struct ThemeOption: Identifiable {
        let theme: any HABTheme
        let description: String
        var id: String { theme.name }
    }

    // MARK: - State

    @State private var activeThemeName = HABThemeManager.shared.theme.name
    @Environment(\.dismiss) private var dismiss

    private let options: [ThemeOption] = [
        ThemeOption(
            theme: HABLightTheme(),
            description: "Parchment backgrounds · Royal Blue primary · Antique Gold accent"
        ),
        ThemeOption(
            theme: HABDarkTheme(),
            description: "Deep navy backgrounds · Brightened Royal Blue · Parchment text"
        ),
        ThemeOption(
            theme: HABAppleTheme(),
            description: "Apple system colors · Adapts automatically to system appearance"
        )
    ]

    // MARK: - Body

    var body: some View {
        NavigationStack {
            List(options) { option in
                Button {
                    HABThemeManager.shared.theme = option.theme
                } label: {
                    HStack(spacing: 12) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(option.theme.name)
                                .font(.headline)
                                .foregroundStyle(Color.primary)
                            Text(option.description)
                                .font(.caption)
                                .foregroundStyle(Color.secondary)
                            swatches(for: option.theme)
                                .padding(.top, 2)
                        }
                        Spacer()
                        if activeThemeName == option.theme.name {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(Color.accentColor)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Theme")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Done") { dismiss() }
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: HABThemeManager.themeDidChangeNotification)) { _ in
                activeThemeName = HABThemeManager.shared.theme.name
            }
        }
    }

    // MARK: - Helpers

    @ViewBuilder
    private func swatches(for theme: any HABTheme) -> some View {
        let colors: [Color] = [
            Color(uiColor: theme.colors.primary),
            Color(uiColor: theme.colors.background),
            Color(uiColor: theme.colors.surface),
            Color(uiColor: theme.colors.foreground)
        ]
        HStack(spacing: 6) {
            ForEach(Array(colors.enumerated()), id: \.offset) { _, color in
                Circle()
                    .fill(color)
                    .frame(width: 16, height: 16)
                    .overlay(Circle().stroke(Color.secondary.opacity(0.3), lineWidth: 1))
            }
        }
    }
}
