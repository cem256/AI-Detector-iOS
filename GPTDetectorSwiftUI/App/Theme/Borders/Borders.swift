//
//  Borders.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import Foundation

protocol BorderProtocol {
    var regular: CGFloat { get }
}

struct Borders: BorderProtocol {
    let regular: CGFloat = 12
}

extension CGFloat {
    static let borderRadius: BorderProtocol = Borders()
}
