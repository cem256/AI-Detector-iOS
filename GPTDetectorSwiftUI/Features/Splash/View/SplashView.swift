//
//  SplashView.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 27.08.2023.
//

import SwiftUI

struct SplashView: View {
    @StateObject private var splashViewModel = SplashViewModel(cacheClient: CacheClient())

    var body: some View {
        NavigationStack {
            switch splashViewModel.isOnboardingCompleted {
            case true:
                DetectorView()
            case false:
                OnboardingView(isOnboardingCompleted: $splashViewModel.isOnboardingCompleted)
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
            SplashView()
        }
    }
}
