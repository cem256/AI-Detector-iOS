//
//  AnalyzeButton.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import SwiftUI

struct AsyncButton: View {
    let action: () async -> Void
    let isLoading: Bool
    let buttonTitle: LocalizedStringKey

    var body: some View {
        Button {
            Task {
                await action()
            }
        } label: {
            if isLoading {
                ProgressView()
            } else {
                Text(buttonTitle)
            }
        }
        .frame(maxWidth: .infinity, minHeight: .buttonSize.regular)
        .background(isLoading ? Color.theme.disabledColor : Color.theme.accentColor)
        .foregroundColor(Color.theme.secondaryTextColor)
        .font(.headline)
        .cornerRadius(.borderRadius.regular)
    }
}
