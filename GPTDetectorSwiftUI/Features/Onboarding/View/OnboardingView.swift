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
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("OnboardingView")
                Spacer()
                Button {
                    onboardingViewModel.completeOnboarding()
                    isOnboardingCompleted = true
                } label: {
                    Text("Get Started")
                        .frame(maxWidth: .infinity, minHeight: .buttonSize.regular)
                        .background(Color.theme.accentColor)
                        .foregroundColor(Color.theme.secondaryTextColor)
                        .font(.headline)
                        .cornerRadius(.borderRadius.regular)
                }
            }
            .padding()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OnboardingView(isOnboardingCompleted: .constant(false))
        }
    }
}
