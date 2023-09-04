//
//  OnboardingView.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 27.08.2023.
//

import Factory
import SwiftUI

struct OnboardingView: View {
    @StateObject private var onboardingViewModel: OnboardingViewModel
    @Binding var isOnboardingCompleted: Bool

    init(onboardingViewModel: OnboardingViewModel, isOnboardingCompleted: Binding<Bool>) {
        self._isOnboardingCompleted = isOnboardingCompleted
        _onboardingViewModel = StateObject(wrappedValue: onboardingViewModel)
    }

    var body: some View {
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: .spacing.veryHigh) {
                Header()
                Group {
                    ImageWithDescription(image: "hand.wave", description: "ONBOARDING1")
                    ImageWithDescription(image: "info.circle", description: "ONBOARDING2")
                    ImageWithDescription(image: "character.bubble", description: "ONBOARDING3")
                }
                .padding(.horizontal)
                Spacer()
                GetStartedButton(completeOnboarding: {
                    onboardingViewModel.completeOnboarding()
                }, isOnboardingCompleted: $isOnboardingCompleted)
            }
            .padding()
        }
    }
}

private struct Header: View {
    var body: some View {
        HStack {
            Spacer()
            ZStack(alignment: .bottom) {
                Image("LaunchScreen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .imageSize.xxLarge, height: .imageSize.xxLarge)
                Text("APP_NAME")
                    .font(.title)
            }
            Spacer()
        }
    }
}

private struct ImageWithDescription: View {
    let image: String
    let description: LocalizedStringKey

    var body: some View {
        HStack(spacing: .spacing.veryHigh) {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: .imageSize.regular, height: .imageSize.regular)
                .foregroundColor(Color.theme.accentColor)

            Text(description)
            Spacer()
        }
    }
}

private struct GetStartedButton: View {
    let completeOnboarding: () -> Void
    @Binding var isOnboardingCompleted: Bool
    var body: some View {
        Button {
            withAnimation {
                completeOnboarding()
                isOnboardingCompleted = true
            }

        } label: {
            Text("ONBOARDING_GET_STARTED")
                .frame(maxWidth: .infinity, minHeight: .buttonSize.regular)
                .background(Color.theme.accentColor)
                .foregroundColor(Color.theme.secondaryTextColor)
                .font(.headline)
                .cornerRadius(.borderRadius.regular)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OnboardingView(onboardingViewModel: Container.shared.onboardingViewModel(), isOnboardingCompleted: .constant(false))
        }
    }
}
