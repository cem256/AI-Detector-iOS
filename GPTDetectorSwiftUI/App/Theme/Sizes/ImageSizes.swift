//
//  ImageSizes.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 30.08.2023.
//

import Foundation

protocol ImageSizesProtocol {
    var small: CGFloat { get }
    var regular: CGFloat { get }
    var large: CGFloat { get }
    var xLarge: CGFloat { get }
    var xxLarge: CGFloat { get }
}

struct ImageSizes: ImageSizesProtocol {
    let small: CGFloat = 32
    let regular: CGFloat = 40
    let large: CGFloat = 48
    let xLarge: CGFloat = 96
    let xxLarge: CGFloat = 152
}

extension CGFloat {
    static let imageSize: ImageSizesProtocol = ImageSizes()
}
