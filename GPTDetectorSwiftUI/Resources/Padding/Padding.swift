//
//  Padding.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import Foundation

protocol PaddingProtocol {
    var low: CGFloat { get }
    var medium: CGFloat { get }
    var high: CGFloat { get }
}

struct Padding: PaddingProtocol {
    var low: CGFloat = 4
    var medium: CGFloat = 8
    var high: CGFloat = 12
}

extension CGFloat {
    static let padding: PaddingProtocol = Padding()
}
