//
//  AppAnimations.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 26.11.2023.
//

import Foundation
import SwiftUI

struct AppAnimations {
    let spring: Animation = .spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)
}

extension Animation {
    static let animations: AppAnimations = .init()
}
