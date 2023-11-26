//
//  ImageCropper.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 2.09.2023.
//

import CropViewController
import SwiftUI
import UIKit

struct ImageCropper: UIViewControllerRepresentable {
    let imageToCrop: UIImage
    @Binding var croppedImage: UIImage
    @Binding var showingScreenCover: Bool
    @Binding var showingImageCropper: Bool

    func makeUIViewController(context: Context) -> CropViewController {
        let cropper = CropViewController(image: imageToCrop)
        cropper.aspectRatioLockEnabled = false
        cropper.aspectRatioPickerButtonHidden = true
        cropper.cropView.backgroundColor = UIColor(Color(R.color.backgroundColor.name))
        cropper.cancelButtonTitle = String(R.string.localizable.button_CANCEL())
        cropper.doneButtonTitle = String(R.string.localizable.button_DONE())
        cropper.delegate = context.coordinator

        return cropper
    }

    func updateUIViewController(_ uiViewController: CropViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(croppedImage: $croppedImage, showingScreenCover: $showingScreenCover, showingImageCropper: $showingImageCropper)
    }

    final class Coordinator: NSObject, CropViewControllerDelegate {
        @Binding var croppedImage: UIImage
        @Binding var showingScreenCover: Bool
        @Binding var showingImageCropper: Bool

        init(croppedImage: Binding<UIImage>, showingScreenCover: Binding<Bool>, showingImageCropper: Binding<Bool>) {
            self._croppedImage = croppedImage
            self._showingScreenCover = showingScreenCover
            self._showingImageCropper = showingImageCropper
        }

        func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
            croppedImage = image
            showingImageCropper = false
            showingScreenCover = false
        }

        func cropViewController(_ cropViewController: CropViewController, didFinishCancelled cancelled: Bool) {
            showingImageCropper = false
            showingScreenCover = false
        }
    }
}
