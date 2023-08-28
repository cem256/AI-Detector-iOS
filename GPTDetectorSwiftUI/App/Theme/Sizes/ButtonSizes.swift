//
//  ButtonSizes.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import Foundation

protocol ButtonSizesProtocol {
    var small: CGFloat { get }
    var regular: CGFloat { get }
    var large: CGFloat { get }
}

struct ButtonSizes: ButtonSizesProtocol {
    let small: CGFloat = 44
    let regular: CGFloat = 55
    let large: CGFloat = 66
}

extension CGFloat {
    static let buttonSize: ButtonSizesProtocol = ButtonSizes()
}
