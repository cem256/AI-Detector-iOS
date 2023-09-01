//
//  Padding.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import Foundation

struct Padding {
    var low: CGFloat = 4
    var medium: CGFloat = 8
    var high: CGFloat = 12
}

extension CGFloat {
    static let padding: Padding = .init()
}
