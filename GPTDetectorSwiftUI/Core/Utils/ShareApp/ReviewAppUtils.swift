//
//  RateAppUtils.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 30.08.2023.
//

import Foundation
import StoreKit

struct ReviewAppUtils {
    private init() {}

    static func reviewApp() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
}
