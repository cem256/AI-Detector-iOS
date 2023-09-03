//
//  DetectorButtonsView.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import SwiftUI
import Vision

struct TextEditorButtons: View {
    let onClearButtonTapped: () -> Void
    @Binding var userInput: String
    @State private var image: UIImage? = nil
    @State private var showingScreenCover = false
    @State private var showingImageCropper = false
    @State private var source: UIImagePickerController.SourceType = .photoLibrary

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
                    self.source = .photoLibrary
                    self.showingScreenCover = true
                } label: {
                    Image(systemName: "photo")
                }
                Button {
                    self.source = .camera
                    self.showingScreenCover = true
                } label: {
                    Image(systemName: "camera")
                }
            }
        }
        .fullScreenCover(isPresented: $showingScreenCover) {
            ZStack {
                ImagePicker(image: $image, showingScreenCover: $showingScreenCover, showingImageCropper: $showingImageCropper, source: source)
                if showingImageCropper {
                    ImageCropper(image: $image, showingScreenCover: $showingScreenCover, showingImageCropper: $showingImageCropper)
                }
            }
            .ignoresSafeArea()
        }
        .onChange(of: image) { _ in
            if !showingImageCropper {
                guard let cgImage = image?.cgImage else { return }
                userInput = TextRecognizerClient().recogizeText(from: cgImage)
            }
        }
        .padding()
        .font(.title2)
    }
}
