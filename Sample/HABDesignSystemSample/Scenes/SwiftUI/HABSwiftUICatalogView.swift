//
//  HABSwiftUICatalogView.swift
//  HABDesignSystemSample
//
//  Created by Christian Grise on 7/21/26.
//

import SwiftUI
import HABFoundation
import HABSwiftUI

// MARK: - HABSwiftUICatalogView

struct HABSwiftUICatalogView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Foundation") {
                    NavigationLink("Colors") { HABColorTokensView() }
                    NavigationLink("Typography") { HABTypeScaleView() }
                }
            }
            .navigationTitle("SwiftUI")
            .withThemeSwitcher()
        }
    }
}

// MARK: - HABColorTokensView

private struct HABColorTokensView: View {

    var body: some View {
        let colors = HABThemeManager.shared.theme.swiftUIColors
        List {
            Section("Brand") {
                ColorRow("primary",           colors.primary)
                ColorRow("secondary",         colors.secondary)
                ColorRow("accent",            colors.accent)
            }
            Section("Background") {
                ColorRow("background",        colors.background)
                ColorRow("backgroundSecondary", colors.backgroundSecondary)
                ColorRow("surface",           colors.surface)
                ColorRow("surfaceElevated",   colors.surfaceElevated)
            }
            Section("Foreground") {
                ColorRow("foreground",        colors.foreground)
                ColorRow("foregroundSecondary", colors.foregroundSecondary)
                ColorRow("foregroundTertiary", colors.foregroundTertiary)
                ColorRow("foregroundDisabled", colors.foregroundDisabled)
                ColorRow("foregroundInverted", colors.foregroundInverted)
            }
            Section("On-Brand") {
                ColorRow("onPrimary",         colors.onPrimary)
                ColorRow("onSecondary",       colors.onSecondary)
            }
            Section("Semantic") {
                ColorRow("destructive",       colors.destructive)
                ColorRow("destructiveSurface", colors.destructiveSurface)
                ColorRow("success",           colors.success)
                ColorRow("successSurface",    colors.successSurface)
                ColorRow("warning",           colors.warning)
                ColorRow("warningSurface",    colors.warningSurface)
                ColorRow("info",              colors.info)
                ColorRow("infoSurface",       colors.infoSurface)
            }
            Section("Chrome") {
                ColorRow("border",            colors.border)
                ColorRow("borderSubtle",      colors.borderSubtle)
                ColorRow("overlay",           colors.overlay)
            }
        }
        .navigationTitle("Colors")
        .navigationBarTitleDisplayMode(.inline)
        .withThemeSwitcher()
    }
}

// MARK: - ColorRow

private struct ColorRow: View {
    let name: String
    let color: Color

    init(_ name: String, _ color: Color) {
        self.name = name
        self.color = color
    }

    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 6)
                .fill(color)
                .frame(width: 36, height: 36)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color(.separator), lineWidth: 0.5)
                )
            Text(name)
                .font(.system(.body, design: .monospaced))
        }
    }
}

// MARK: - HABTypeScaleView

private struct HABTypeScaleView: View {

    private struct TypeRow: Identifiable {
        let id = UUID()
        let name: String
        let font: Font
        let size: String
    }

    var body: some View {
        let fonts = HABThemeManager.shared.theme.swiftUIFonts
        let rows: [TypeRow] = [
            TypeRow(name: "display",      font: fonts.display,      size: "40pt"),
            TypeRow(name: "largeTitle",   font: fonts.largeTitle,   size: "34pt"),
            TypeRow(name: "title1",       font: fonts.title1,       size: "28pt"),
            TypeRow(name: "title2",       font: fonts.title2,       size: "22pt"),
            TypeRow(name: "title3",       font: fonts.title3,       size: "20pt"),
            TypeRow(name: "headline",     font: fonts.headline,     size: "17pt semibold"),
            TypeRow(name: "body",         font: fonts.body,         size: "17pt"),
            TypeRow(name: "callout",      font: fonts.callout,      size: "16pt"),
            TypeRow(name: "subheadline",  font: fonts.subheadline,  size: "15pt"),
            TypeRow(name: "footnote",     font: fonts.footnote,     size: "13pt"),
            TypeRow(name: "caption1",     font: fonts.caption1,     size: "12pt"),
            TypeRow(name: "caption2",     font: fonts.caption2,     size: "11pt"),
        ]

        List(rows) { row in
            VStack(alignment: .leading, spacing: 2) {
                Text("The quick brown fox")
                    .font(row.font)
                HStack {
                    Text(row.name)
                        .font(.system(.caption2, design: .monospaced))
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(row.size)
                        .font(.system(.caption2))
                        .foregroundStyle(.tertiary)
                }
            }
            .padding(.vertical, 4)
        }
        .navigationTitle("Typography")
        .navigationBarTitleDisplayMode(.inline)
        .withThemeSwitcher()
    }
}
