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
    @Binding var image: UIImage?
    @Binding var showingScreenCover: Bool
    @Binding var showingImageCropper: Bool

    func makeUIViewController(context: Context) -> CropViewController {
        let img = image ?? UIImage()
        let cropper = CropViewController(image: img)
        cropper.aspectRatioLockEnabled = false
        cropper.aspectRatioPickerButtonHidden = true
        cropper.cropView.backgroundColor = UIColor(Color.theme.backgroundColor)
        cropper.delegate = context.coordinator
        
        return cropper
    }
    
    func updateUIViewController(_ uiViewController: CropViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(image: $image, showingScreenCover: $showingScreenCover, showingImageCropper: $showingImageCropper)
    }
  
    final class Coordinator: NSObject, CropViewControllerDelegate {
        @Binding var image: UIImage?
        @Binding var showingScreenCover: Bool
        @Binding var showingImageCropper: Bool
    
        init(image: Binding<UIImage?>, showingScreenCover: Binding<Bool>, showingImageCropper: Binding<Bool>) {
            self._image = image
            self._showingScreenCover = showingScreenCover
            self._showingImageCropper = showingImageCropper
        }
        
        func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
            self.image = image
            showingImageCropper = false
            showingScreenCover = false
        }
    
        func cropViewController(_ cropViewController: CropViewController, didFinishCancelled cancelled: Bool) {
            showingImageCropper = false
            showingScreenCover = false
        }
    }
}
