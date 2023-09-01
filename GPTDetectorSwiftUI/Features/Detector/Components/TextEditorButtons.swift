//
//  DetectorButtonsView.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import SwiftUI

struct TextEditorButtons: View {
    let clearAction: () -> Void

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    clearAction()
                } label: {
                    Image(systemName: "xmark")
                }
            }.padding()
            Spacer()
        }
        .font(.title2)
    }
}
