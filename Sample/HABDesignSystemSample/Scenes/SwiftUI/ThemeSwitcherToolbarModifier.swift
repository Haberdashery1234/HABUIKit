//
//  ThemeSwitcherToolbarModifier.swift
//  HABDesignSystemSample
//
//  Created by Christian Grise on 7/21/26.
//
//  Injects the theme-switcher palette button into any SwiftUI screen's
//  navigation bar. Apply via .withThemeSwitcher() on any view inside
//  a NavigationStack.
//

import SwiftUI

// MARK: - ThemeSwitcherToolbarModifier

private struct ThemeSwitcherToolbarModifier: ViewModifier {
    @State private var showThemeSwitcher = false

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showThemeSwitcher = true
                    } label: {
                        Image(systemName: "paintpalette")
                    }
                }
            }
            .sheet(isPresented: $showThemeSwitcher) {
                HABSwiftUIThemeSwitcherView()
            }
    }
}

// MARK: - View Extension

extension View {
    func withThemeSwitcher() -> some View {
        modifier(ThemeSwitcherToolbarModifier())
    }
}
