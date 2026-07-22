//
//  HABButtonStyleDemoView.swift
//  HABDesignSystemSample
//
//  Created by Christian Grise on 7/21/26.
//

import SwiftUI
import HABSwiftUI
import HABFoundation

struct HABButtonStyleDemoView: View {

    // MARK: - State

    @State private var style: HABButtonStyle.Style = .primary
    @State private var size: HABButtonStyle.Size = .medium
    @State private var isLoading = false
    @State private var isEnabled = true

    // MARK: - Body

    var body: some View {
        List {

            // MARK: Preview

            Section {
                HStack {
                    Spacer()
                    Button("Button") { }
                        .buttonStyle(HABButtonStyle(style: style, size: size, isLoading: isLoading))
                        .disabled(!isEnabled)
                    Spacer()
                }
                .padding(.vertical, 32)
            }

            // MARK: Appearance

            Section("Appearance") {
                Picker("Style", selection: $style) {
                    Text("Primary").tag(HABButtonStyle.Style.primary)
                    Text("Secondary").tag(HABButtonStyle.Style.secondary)
                    Text("Ghost").tag(HABButtonStyle.Style.ghost)
                    Text("Destructive").tag(HABButtonStyle.Style.destructive)
                }
                Picker("Size", selection: $size) {
                    Text("Small").tag(HABButtonStyle.Size.small)
                    Text("Medium").tag(HABButtonStyle.Size.medium)
                    Text("Large").tag(HABButtonStyle.Size.large)
                }
            }

            // MARK: Options

            Section("Options") {
                Toggle("isLoading", isOn: $isLoading)
                Toggle("isEnabled", isOn: $isEnabled)
            }
        }
        .navigationTitle("HABButtonStyle")
        .navigationBarTitleDisplayMode(.inline)
        .withThemeSwitcher()
    }
}
