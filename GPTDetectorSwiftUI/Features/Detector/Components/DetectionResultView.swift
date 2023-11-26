//
//  DetectionResultView.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import SwiftUI

struct DetectionResultView: View {
    let detectionResponse: DetectionResponse?

    var body: some View {
        VStack(spacing: .spacing.medium) {
            Text(resultFromResponse.title)
            Text(resultFromResponse.subtitle)
        }
        .foregroundColor(Color(R.color.secondaryTextColor.name))
        .font(.headline)
        .frame(maxWidth: .infinity)
        .padding(.vertical, .padding.medium)
        .background(resultFromResponse.backgroundColor)
        .cornerRadius(.borderRadius.regular)
    }

    private var resultFromResponse: (title: String, subtitle: String, backgroundColor: Color) {
        switch detectionResponse?.uClassification {
        case .initial, .none:
            return (R.string.localizable.detector_CLASSIFICATION_TITLE_INITIAL(), R.string.localizable.detector_CLASSIFICATION_DESCRIPTION_INITIAL(), Color(R.color.accentColor.name))
        case .ai:
            return (R.string.localizable.detector_CLASSIFICATION_TITLE_AI(), R.string.localizable.detector_CLASSIFICATION_DESCRIPTION_AI(), Color(R.color.aiContentColor.name))
        case .mixed:
            return (R.string.localizable.detector_CLASSIFICATION_TITLE_MIXED(), R.string.localizable.detector_CLASSIFICATION_DESCRIPTION_MIXED(), Color(R.color.mixedContentColor.name))
        case .human:
            return (R.string.localizable.detector_CLASSIFICATION_TITLE_HUMAN(), R.string.localizable.detector_CLASSIFICATION_DESCRIPTION_HUMAN(), Color(R.color.humanContentColor.name))
        }
    }
}
