//
//  OnboardingViewModel.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 27.08.2023.
//

import Foundation

protocol OnboardingViewModelProtocol: ObservableObject {
    func completeOnboarding()
}

final class OnboardingViewModel: OnboardingViewModelProtocol {
    private let cacheClient: CacheClientProtocol

    init(cacheClient: CacheClientProtocol) {
        self.cacheClient = cacheClient
    }

    func completeOnboarding() {
        cacheClient.save(for: CacheKeys.onboarding, item: true)
    }
}
