//
//  Spacing.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import Foundation

protocol SpacingProtocol {
    var low: CGFloat { get }
    var medium: CGFloat { get }
    var high: CGFloat { get }
    var veryHigh: CGFloat { get }
}

struct Spacing: SpacingProtocol {
    var low: CGFloat = 4
    var medium: CGFloat = 8
    var high: CGFloat = 12
    var veryHigh: CGFloat = 24
}

extension CGFloat {
    static let spacing: SpacingProtocol = Spacing()
}
