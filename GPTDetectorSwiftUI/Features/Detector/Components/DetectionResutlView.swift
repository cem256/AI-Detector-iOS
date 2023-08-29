//
//  DetectionResutlView.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import SwiftUI

struct DetectionResutlView: View {
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

    private var resultFromResponse: (title: String, subtitle: String, backgroundColor: Color) {
        switch detectionResponse?.uClassification {
        case .initial, .none:
            return ("Type In", "Text For Analysis", Color.theme.accentColor)
        case .ai:
            return ("AI", "Likely Written by AI", Color.theme.aiContentColor)
        case .mixed:
            return ("Mixed", "May Include Parts Written by AI", Color.theme.mixedContentColor)
        case .human:
            return ("Human", "Likely Written by Human", Color.theme.humanContentColor)
        }
    }
}
