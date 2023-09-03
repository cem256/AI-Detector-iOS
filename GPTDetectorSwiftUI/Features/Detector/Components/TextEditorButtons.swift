//
//  DetectorButtonsView.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import AVFoundation
import SwiftUI

struct TextEditorButtons: View {
    let onClearButtonTapped: () -> Void
    let onPhotoLibraryButtonTapped: () -> Void
    let onCameraButtonTapped: () async -> Void

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    onClearButtonTapped()
                } label: {
                    Image(systemName: "xmark")
                }
            }
            Spacer()
            HStack(spacing: .spacing.high) {
                Spacer()
                Button {
                    onPhotoLibraryButtonTapped()
                } label: {
                    Image(systemName: "photo")
                }
                Button {
                    Task {
                        await onCameraButtonTapped()
                    }
                } label: {
                    Image(systemName: "camera")
                }
            }
        }
        .padding()
        .font(.title2)
    }
}
