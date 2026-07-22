//
//  HABSwiftUICatalogView.swift
//  HABDesignSystemSample
//
//  Created by Christian Grise on 7/21/26.
//

import SwiftUI
import HABFoundation
import HABSwiftUI

// MARK: - CatalogDestination

private enum CatalogDestination: Hashable {
    case buttonStyle
    case textField
}

// MARK: - HABSwiftUICatalogView

struct HABSwiftUICatalogView: View {

    // MARK: - Body

    var body: some View {
        NavigationStack {
            List {
                Section("Buttons") {
                    NavigationLink("HABButtonStyle", value: CatalogDestination.buttonStyle)
                }
                Section("Inputs") {
                    NavigationLink("HABTextField", value: CatalogDestination.textField)
                }
            }
            .navigationTitle("SwiftUI")
            .withThemeSwitcher()
            .navigationDestination(for: CatalogDestination.self) { destination in
                switch destination {
                case .buttonStyle:
                    HABButtonStyleDemoView()
                case .textField:
                    HABTextFieldDemoView()
                }
            }
        }
    }
}
