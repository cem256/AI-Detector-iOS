//
//  DetectorButtonsView.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import PhotosUI
import SwiftUI
import Vision

struct TextEditorButtons: View {
    let clearAction: () -> Void
    @Binding var userInput: String

    @State private var selectedImage: PhotosPickerItem?

    @MainActor
    func recognizeText() async {
        if let data = try? await selectedImage?.loadTransferable(type: Data.self) {
            let result = TextRecognizerClient().recogizeText(from: data)
            userInput = result
        }
    }

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
            HStack(spacing: .spacing.high) {
                Spacer()
                PhotosPicker(selection: $selectedImage, matching: .any(of: [.images, .screenshots])) {
                    Image(systemName: "photo")
                }

                Button {} label: {
                    Image(systemName: "camera")
                }
            }
        }
        .padding()
        .font(.title2)
        .onChange(of: selectedImage, perform: { _ in
            Task {
                await recognizeText()
            }
        })
    }
}
