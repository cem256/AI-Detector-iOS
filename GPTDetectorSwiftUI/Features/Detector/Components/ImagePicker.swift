//
//  ImagePicker.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 2.09.2023.
//

import SwiftUI
import UniformTypeIdentifiers

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var showingScreenCover: Bool
    @Binding var showingImageCropper: Bool
    let imagePickerSource: UIImagePickerController.SourceType

    init(image: Binding<UIImage?>, showingScreenCover: Binding<Bool>, showingImageCropper: Binding<Bool>, imagePickerSource: UIImagePickerController.SourceType) {
        self._image = image
        self._showingScreenCover = showingScreenCover
        self._showingImageCropper = showingImageCropper
        self.imagePickerSource = imagePickerSource
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = imagePickerSource
        picker.mediaTypes = [UTType.image.identifier]
        picker.allowsEditing = false
        picker.delegate = context.coordinator

        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(image: $image, showingScreenCover: $showingScreenCover, showingImageCropper: $showingImageCropper)
    }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @Binding var image: UIImage?
        @Binding var showingScreenCover: Bool
        @Binding var showingImageCropper: Bool

        init(image: Binding<UIImage?>, showingScreenCover: Binding<Bool>, showingImageCropper: Binding<Bool>) {
            self._image = image
            self._showingScreenCover = showingScreenCover
            self._showingImageCropper = showingImageCropper
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            guard let newImage = info[.originalImage] as? UIImage else { return }
            image = newImage
            showingScreenCover = true
            withAnimation {
                showingImageCropper = true
            }
        }
    }
}
