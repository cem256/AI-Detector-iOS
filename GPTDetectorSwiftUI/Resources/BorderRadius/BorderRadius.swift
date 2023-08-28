//
//  Radius.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import Foundation

protocol BorderRadiusProtocol {
    var regular: CGFloat { get }
}

struct BorderRadius: BorderRadiusProtocol {
    let regular: CGFloat = 12
}

extension CGFloat {
    static let borderRadius: BorderRadiusProtocol = BorderRadius()
}
