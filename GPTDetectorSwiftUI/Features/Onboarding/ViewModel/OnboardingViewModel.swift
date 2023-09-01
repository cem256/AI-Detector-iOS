//
//  OnboardingViewModel.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 27.08.2023.
//

import Foundation

final class OnboardingViewModel: ObservableObject {
    private let cacheClient: CacheClientProtocol

    init(cacheClient: CacheClientProtocol) {
        self.cacheClient = cacheClient
    }

    func completeOnboarding() {
        cacheClient.save(for: CacheKeys.onboarding, item: true)
    }
}
