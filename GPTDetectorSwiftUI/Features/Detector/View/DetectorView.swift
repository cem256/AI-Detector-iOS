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
                DetectionResultView(detectionResponse: vm.detectionResult)
                ZStack {
                    TextEditorWithPlaceholder(text: $vm.userInput, placeholder: "DETECTOR_TEXT_EDITOR_PLACEHOLDER")
                    TextEditorButtons(onClearButtonTapped: vm.onClearButtonTapped, onPhotoLibraryButtonTapped: vm.onPhotoLibraryButtonTapped, onCameraButtonTapped: vm.onCameraButtonTapped)
                }
                HelperTextView(isValidInput: vm.isValidInput, inputLength: vm.userInputLength)
                    .offset(x: vm.isAnimationActive ? .spacing.high : .spacing.zero)
                AsyncButton(action: {
                    if vm.isValidInput {
                        await vm.detect()
                    } else {
                        vm.toggleAnimation()
                        withAnimation(.animations.spring) {
                            vm.toggleAnimation()
                        }
                    }
                }, isLoading: vm.isLoading, buttonTitle: "DETECTOR_BUTTON_ANALYZE")
            }
            .padding()
            .alert(LocalizedStringKey(vm.errorType?.errorTitle ?? AppError.unknownError.errorTitle), isPresented: $vm.showingError, actions: {
                alertButtons
            }, message: {
                Text(LocalizedStringKey(vm.errorType?.errorDescription ?? AppError.unknownError.errorDescription))
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
            Button("BUTTON_OK") {}
        } else {
            Button("BUTTON_CANCEL", role: .cancel) {}
            Button("BUTTON_OPEN_SETTINGS") { PermissionHandlerClient.openAppSettings() }
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
