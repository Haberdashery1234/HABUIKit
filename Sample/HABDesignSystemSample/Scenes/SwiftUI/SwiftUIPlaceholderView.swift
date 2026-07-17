//
//  SwiftUIPlaceholderView.swift
//  HABDesignSystemSample
//

import SwiftUI

struct SwiftUIPlaceholderView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "swift")
                .font(.system(size: 56))
                .foregroundStyle(.orange)
            Text("SwiftUI Components")
                .font(.title2)
                .fontWeight(.semibold)
            Text("Coming soon")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}
