//
//  HABThemeObserver.swift
//  HABDesignSystemSample
//
//  Created by Christian Grise on 7/21/26.
//
//  Bridges HABThemeManager's notification-based updates to SwiftUI's
//  reactive system. Kept for future use when SwiftUI components need
//  to respond to theme changes.
//

import Foundation
import Combine
import HABFoundation

final class HABThemeObserver: ObservableObject {

    // MARK: - Published

    @Published private(set) var theme: any HABTheme = HABThemeManager.shared.theme

    // MARK: - Private

    private var observer: NSObjectProtocol?

    // MARK: - Init

    init() {
        observer = NotificationCenter.default.addObserver(
            forName: HABThemeManager.themeDidChangeNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.theme = HABThemeManager.shared.theme
        }
    }

    deinit {
        if let observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
}
