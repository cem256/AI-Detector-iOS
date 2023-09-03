//
//  UserInputConstants.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 3.09.2023.
//

import Foundation

struct UserInputConstants {
    private init() {}

    static let minInputLength: Int = 250
    static let maxInputLength: Int = 3000

    static func isShortInput(inputLength: Int) -> Bool {
        return inputLength < minInputLength
    }
    
    
}
