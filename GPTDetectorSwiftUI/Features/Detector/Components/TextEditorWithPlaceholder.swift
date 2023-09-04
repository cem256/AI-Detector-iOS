//
//  TextEditorWithPlaceholder.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 27.08.2023.
//

import SwiftUI

struct TextEditorWithPlaceholder: View {
    @Binding var text: String
    let placeholder: LocalizedStringKey
    @FocusState private var isFocused

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                VStack {
                    Text(placeholder)
                        .padding()
                        .padding(.top, .padding.medium)
                        .padding(.leading, .padding.low)
                    Spacer()
                }
            }
            VStack {
                TextEditor(text: $text)
                    .padding()
                    .scrollContentBackground(.hidden)
                    .background(Color.theme.backgroundColor)
                    .opacity(text.isEmpty ? 0.5 : 1)
                    .overlay(
                        RoundedRectangle(cornerRadius: .borderRadius.regular)
                            .stroke(isFocused ? Color.theme.accentColor : Color.theme.disabledColor, lineWidth: 2)
                    )

                Spacer()

            }.focused($isFocused)
        }
    }
}
