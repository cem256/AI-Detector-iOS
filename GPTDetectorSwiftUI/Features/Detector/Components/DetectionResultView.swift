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
        .foregroundColor(Color.theme.secondaryTextColor)
        .font(.headline)
        .frame(maxWidth: .infinity)
        .padding(.vertical, .padding.medium)
        .background(resultFromResponse.backgroundColor)
        .cornerRadius(.borderRadius.regular)
    }

    private var resultFromResponse: (title: LocalizedStringKey, subtitle: LocalizedStringKey, backgroundColor: Color) {
        switch detectionResponse?.uClassification {
        case .initial, .none:
            return ("DETECTOR_CLASSIFICATION_TITLE_INITIAL", "DETECTOR_CLASSIFICATION_DESCRIPTION_INITIAL", Color.theme.accentColor)
        case .ai:
            return ("DETECTOR_CLASSIFICATION_TITLE_AI", "DETECTOR_CLASSIFICATION_DESCRIPTION_AI", Color.theme.aiContentColor)
        case .mixed:
            return ("DETECTOR_CLASSIFICATION_TITLE_MIXED", "DETECTOR_CLASSIFICATION_DESCRIPTION_MIXED", Color.theme.mixedContentColor)
        case .human:
            return ("DETECTOR_CLASSIFICATION_TITLE_HUMAN", "DETECTOR_CLASSIFICATION_DESCRIPTION_HUMAN", Color.theme.humanContentColor)
        }
    }
}
