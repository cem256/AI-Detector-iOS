//
//  DetectorView.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 27.08.2023.
//

import Factory
import SwiftUI

struct DetectorView: View {
    @StateObject private var vm: DetectorViewModel

    init(detectorViewModel: DetectorViewModel) {
        _vm = StateObject(wrappedValue: detectorViewModel)
    }

    var body: some View {
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea()
            VStack(spacing: .spacing.high) {
                HeaderView()
                    .padding(.horizontal)
                DetectionResutlView(detectionResponse: vm.detectionResult)
                ZStack {
                    TextEditorWithPlaceholder(text: $vm.userInput, placeholder: "Paste text or type here...")
                    TextEditorButtons(onClearButtonTapped: vm.onClearButtonTapped, onPhotoLibraryButtonTapped: vm.onPhotoLibraryButtonTapped, onCameraButtonTapped: vm.onCameraButtonTapped)
                }
                HelperTextView(isValidInput: vm.isValidInput, inputLength: vm.userInputLength)
                AsyncButton(action: {
                    await vm.detect()
                }, isLoading: vm.isLoading, isDisabled: vm.isLoading || !vm.isValidInput, buttonTitle: "Analyze")
            }
            .padding()
            .alert(vm.errorType?.errorTitle ?? AppError.unknownError.errorTitle, isPresented: $vm.showingError, actions: {
                alertButtons
            }, message: {
                Text(vm.errorType?.errorDescription ?? AppError.unknownError.errorDescription)
            })
            .fullScreenCover(isPresented: $vm.showingScreenCover) {
                fullScreenCoverContent
            }
            .onChange(of: vm.croppedImage) { _ in
                vm.performOcrFromImage()
            }
        }
        .onTapGesture {
            self.endTextEditing()
        }
    }
}

extension DetectorView {
    @ViewBuilder
    private var alertButtons: some View {
        if vm.errorType != .cameraPermissionDenied {
            Button("OK") {}
        } else {
            Button("Cancel", role: .cancel) {}
            Button("Open Settings") { PermissionHandlerClient.openAppSettings() }
                .buttonStyle(.borderedProminent)
        }
    }

    private var fullScreenCoverContent: some View {
        ZStack {
            ImagePicker(image: $vm.selectedImage, showingScreenCover: $vm.showingScreenCover, showingImageCropper: $vm.showingImageCropper, imagePickerSource: vm.imagePickerSource)
            if vm.showingImageCropper {
                ImageCropper(imageToCrop: vm.selectedImage ?? UIImage(), croppedImage: $vm.croppedImage, showingScreenCover: $vm.showingScreenCover, showingImageCropper: $vm.showingImageCropper)
            }
        }
        .ignoresSafeArea()
    }
}

struct DetectorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetectorView(detectorViewModel: Container.shared.detectorViewModel())
        }
    }
}
