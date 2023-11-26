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
            Color(R.color.backgroundColor.name)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: .spacing.veryHigh) {
                Header()
                Group {
                    ImageWithDescription(image: "hand.wave", description: R.string.localizable.onboarding1())
                    ImageWithDescription(image: "info.circle", description: R.string.localizable.onboarding2())
                    ImageWithDescription(image: "character.bubble", description: R.string.localizable.onboarding3())
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
                Image(R.image.launchScreen)
                    .resizable()
                    .scaledToFit()
                    .frame(width: .imageSize.xxLarge, height: .imageSize.xxLarge)
                Text(R.string.localizable.app_NAME())
                    .font(.title)
            }
            Spacer()
        }
    }
}

private struct ImageWithDescription: View {
    let image: String
    let description: String

    var body: some View {
        HStack(spacing: .spacing.veryHigh) {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: .imageSize.regular, height: .imageSize.regular)
                .foregroundColor(Color(R.color.accentColor.name))

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
            Text(R.string.localizable.onboarding_GET_STARTED())
                .frame(maxWidth: .infinity, minHeight: .buttonSize.regular)
                .background(Color(R.color.accentColor.name))
                .foregroundColor(Color(R.color.secondaryTextColor.name))
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
