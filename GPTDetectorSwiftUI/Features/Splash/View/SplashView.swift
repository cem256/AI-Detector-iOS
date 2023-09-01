//
//  SplashView.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 27.08.2023.
//

import Factory
import SwiftUI

struct SplashView: View {
    @StateObject private var splashViewModel: SplashViewModel

    init(splashViewModel: SplashViewModel) {
        _splashViewModel = StateObject(wrappedValue: splashViewModel)
    }

    var body: some View {
        NavigationStack {
            switch splashViewModel.isOnboardingCompleted {
            case true:
                DetectorView(detectorViewModel: Container.shared.detectorViewModel())
            case false:
                OnboardingView(onboardingViewModel: Container.shared.onboardingViewModel(), isOnboardingCompleted: $splashViewModel.isOnboardingCompleted)
            }
        }
        .onAppear {
            splashViewModel.checkIsOnboardingCompleted()
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SplashView(splashViewModel: Container.shared.splashViewModel())
        }
    }
}
