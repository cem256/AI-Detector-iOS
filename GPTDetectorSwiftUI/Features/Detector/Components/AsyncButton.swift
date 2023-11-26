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
    let buttonTitle: String

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
        .background(isLoading ? Color(R.color.disabledColor.name) : Color(R.color.accentColor.name))
        .foregroundColor(Color(R.color.secondaryTextColor.name))
        .font(.headline)
        .cornerRadius(.borderRadius.regular)
    }
}
