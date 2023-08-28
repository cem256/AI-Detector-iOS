//
//  Colors.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import Foundation
import SwiftUI

protocol ColorSchemeProtocol {
    var accentColor: Color { get }
    var backgroundColor: Color { get }
    var humanContentColor: Color { get }
    var mixedContentColor: Color { get }
    var aiContentColor: Color { get }
    var disabledColor: Color { get }
    var secondaryTextColor: Color { get }
}

struct ColorScheme: ColorSchemeProtocol {
    let accentColor: Color = .init("AccentColor")
    let backgroundColor: Color = .init("BackgroundColor")
    let humanContentColor: Color = .init("HumanContentColor")
    let mixedContentColor: Color = .init("MixedContentColor")
    let aiContentColor: Color = .init("AIContentColor")
    let disabledColor: Color = .init("DisabledColor")
    let secondaryTextColor: Color = .init("SecondaryTextColor")
}

extension Color {
    static let theme: ColorSchemeProtocol = ColorScheme()
}
