//
//  SplashViewModel.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 27.08.2023.
//

import Foundation

protocol SplashViewModelProtocol: ObservableObject {
    func checkIsOnboardingCompleted()
}

final class SplashViewModel: SplashViewModelProtocol {
    private let cacheClient: CacheClientProtocol

    init(cacheClient: CacheClientProtocol) {
        self.cacheClient = cacheClient
    }

    @Published var isOnboardingCompleted: Bool = false

    func checkIsOnboardingCompleted() {
        if let result: Bool = cacheClient.get(for: CacheKeys.onboarding) {
            isOnboardingCompleted = result
            return
        }
        isOnboardingCompleted = false
    }
}
