//
//  ColorScheme.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import Foundation
import SwiftUI

struct ColorScheme {
    let accentColor: Color = .init("AccentColor")
    let backgroundColor: Color = .init("BackgroundColor")
    let humanContentColor: Color = .init("HumanContentColor")
    let mixedContentColor: Color = .init("MixedContentColor")
    let aiContentColor: Color = .init("AIContentColor")
    let disabledColor: Color = .init("DisabledColor")
    let secondaryTextColor: Color = .init("SecondaryTextColor")
}

extension Color {
    static let theme: ColorScheme = .init()
}
