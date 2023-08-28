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
        NavigationView {
            if splashViewModel.isOnboardingCompleted {
                DetectorView()
            } else {
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
        NavigationView {
            SplashView()
        }
    }
}
