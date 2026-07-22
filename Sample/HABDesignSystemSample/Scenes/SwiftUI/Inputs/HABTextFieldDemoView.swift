//
//  HABTextFieldDemoView.swift
//  HABDesignSystemSample
//
//  Created by Christian Grise on 7/21/26.
//

import SwiftUI
import HABSwiftUI
import HABFoundation

struct HABTextFieldDemoView: View {

    // MARK: - State

    @State private var text = ""
    @State private var style: HABTextField.Style = .outlined
    @State private var showTopLabel = true
    @State private var showHelperText = false
    @State private var showErrorText = false
    @State private var showLeadingIcon = false
    @State private var showTrailingAction = false
    @State private var isEnabled = true

    // MARK: - Body

    var body: some View {
        List {

            // MARK: Preview

            Section {
                HABTextField(
                    style: style,
                    text: $text,
                    placeholder: "you@example.com",
                    topLabel: showTopLabel ? "Email" : nil,
                    helperText: showHelperText ? "This is a helper message." : nil,
                    errorText: showErrorText ? "Please enter a valid email." : nil,
                    leadingIcon: showLeadingIcon ? Image(systemName: "envelope") : nil,
                    trailingIcon: showTrailingAction ? Image(systemName: "xmark.circle.fill") : nil,
                    trailingAction: showTrailingAction ? { text = "" } : nil
                )
                .disabled(!isEnabled)
                .padding(.vertical, 8)
            }

            // MARK: Appearance

            Section("Appearance") {
                Picker("Style", selection: $style) {
                    Text("Outlined").tag(HABTextField.Style.outlined)
                    Text("Filled").tag(HABTextField.Style.filled)
                }
            }

            // MARK: Labels

            Section("Labels") {
                Toggle("Top Label", isOn: $showTopLabel)
                Toggle("Helper Text", isOn: $showHelperText)
                Toggle("Error Text", isOn: $showErrorText)
            }

            // MARK: Icons

            Section("Icons") {
                Toggle("Leading Icon", isOn: $showLeadingIcon)
                Toggle("Trailing Action", isOn: $showTrailingAction)
            }

            // MARK: State

            Section("State") {
                Toggle("isEnabled", isOn: $isEnabled)
            }
        }
        .navigationTitle("HABTextField")
        .navigationBarTitleDisplayMode(.inline)
        .withThemeSwitcher()
    }
}
