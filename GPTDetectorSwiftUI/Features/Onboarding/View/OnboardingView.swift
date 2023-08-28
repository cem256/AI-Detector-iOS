//
//  OnboardingView.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 27.08.2023.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject private var onboardingViewModel = OnboardingViewModel(cacheClient: CacheClient())
    @Binding var isOnboardingCompleted: Bool

    var body: some View {
        VStack {
            Spacer()
            Text("OnboardingView")
            Spacer()
            Button {
                onboardingViewModel.completeOnboarding()
                isOnboardingCompleted = true
            } label: {
                Text("Get Started")
            }
        }
        .padding()
    }

    struct OnboardingView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                OnboardingView(isOnboardingCompleted: .constant(false))
            }
        }
    }
}
