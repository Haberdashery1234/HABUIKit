//
//  HABAppleTheme.swift
//  HABUIKit
//
//  A theme built entirely on Apple's adaptive semantic colors.
//  Colors automatically shift between light and dark based on the
//  user's system appearance — no hardcoded values anywhere.
//
//  Use this when you want components that look at home on any
//  Apple platform without any visual opinion of your own.
//

import UIKit

public struct HABAppleTheme: HABTheme {
    public let name = "HABApple"

    public var colors: HABColorTokens { HABColorTokens() }
    public var typography: HABTypographyTokens { HABTypographyTokens() }

    public init() {}
}
