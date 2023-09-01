//
//  Spacing.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import Foundation

struct Spacing {
    var low: CGFloat = 4
    var medium: CGFloat = 8
    var high: CGFloat = 12
    var veryHigh: CGFloat = 24
}

extension CGFloat {
    static let spacing: Spacing = .init()
}
