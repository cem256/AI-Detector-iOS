//
//  Locator.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 1.09.2023.
//

import Factory
import Foundation

extension Container {
    // MARK: ViewModels

    var splashViewModel: Factory<SplashViewModel> {
        Factory(self) { SplashViewModel(cacheClient: self.cacheClient()) }
    }

    var onboardingViewModel: Factory<OnboardingViewModel> {
        Factory(self) { OnboardingViewModel(cacheClient: self.cacheClient()) }
    }

    var detectorViewModel: Factory<DetectorViewModel> {
        Factory(self) { DetectorViewModel(detectorService: self.detectorService()) }
    }

    // MARK: Services

    private var detectorService: Factory<DetectorServiceProtocol> {
        Factory(self) { DetectorService(networkClient: self.networkClient()) }
    }

    // MARK: Clients

    private var cacheClient: Factory<CacheClientProtocol> {
        Factory(self) { CacheClient() }
    }

    private var networkClient: Factory<NetworkClientProtocol> {
        Factory(self) { NetworkClient(baseUrl: Env.baseUrl, bearer: Env.bearer) }
    }
}
