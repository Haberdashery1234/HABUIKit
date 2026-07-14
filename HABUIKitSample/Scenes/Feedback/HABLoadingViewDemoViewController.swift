//
//  HABLoadingViewDemoViewController.swift
//  HABUIKitSample
//
//  Created by Christian Grise on 7/4/26.
//

import UIKit
import HABUIKit

final class HABLoadingViewDemoViewController: ComponentDemoViewController {
    // MARK: - Component

    private let loadingView = HABLoadingView(style: .spinner, message: "Loading…")

    // MARK: - setupComponent

    override func setupComponent() {
        self.title = "HABLoadingView"
        setPreviewHeight(200)

        loadingView.translatesAutoresizingMaskIntoConstraints = false
        previewPanel.addSubview(loadingView)

        NSLayoutConstraint.activate([
            loadingView.leadingAnchor.constraint(equalTo: previewPanel.leadingAnchor, constant: HABSpacing.lg),
            loadingView.trailingAnchor.constraint(equalTo: previewPanel.trailingAnchor, constant: -HABSpacing.lg),
            loadingView.centerYAnchor.constraint(equalTo: previewPanel.centerYAnchor)
        ])
    }

    // MARK: - setupSettings

    override func setupSettings() {
        addSectionHeader("Appearance")
        addRow(label: "Style", control: makeSegmented(items: ["Spinner", "Linear"]) { [weak self] index in
            guard let self else { return }
            self.loadingView.style = index == 0 ? .spinner : .linear
        })

        addSectionHeader("Options")
        addRow(label: "Message", control: makeSwitch(isOn: true) { [weak self] isOn in
            guard let self else { return }
            self.loadingView.message = isOn ? "Loading…" : nil
        })

        addRow(
            label: "Progress",
            control: makeStepper(
                value: 0,
                min: 0,
                max: 100,
                step: 5,
                format: { "\(Int($0))%" },
                onChange: { [weak self] value in
                    guard let self else { return }
                    self.loadingView.progress = Float(value) / 100
                }
            )
        )
    }
}
