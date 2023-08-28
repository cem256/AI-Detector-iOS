//
//  DetectorButtonsView.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import SwiftUI

struct DetectorButtonsView: View {
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
            }
            Spacer()
            HStack(spacing: .spacing.medium) {
                Spacer()
                Button {} label: {
                    Image(systemName: "photo")
                }

                Button {} label: {
                    Image(systemName: "camera")
                }
            }
        }
        .font(.title2)
    }
}
