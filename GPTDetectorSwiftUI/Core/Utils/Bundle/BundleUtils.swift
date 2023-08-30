//
//  BundleUtils.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 30.08.2023.
//

import Foundation

struct BundleUtils {
    private init() {}

    static var appVersion: String {
        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            return "Unknown"
        }
        return version
    }
}
