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
            .alert(isPresented: $vm.showingError) {
                Alert(title: Text("Oops, Something Went Wrong"), message: Text("Don't worry, it's not your fault. Our team is on it."))
            }
            .alert(isPresented: $vm.showingPermissionAlert) {
                Alert(
                    title: Text("Camera Permission Required"),
                    message: Text("Please grant permission to access the camera in settings."),
                    primaryButton: .default(Text("Open Settings"), action: {
                        if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(settingsURL)
                        }
                    }),
                    secondaryButton: .cancel(Text("Cancel"))
                )
            }
            .fullScreenCover(isPresented: $vm.showingScreenCover) {
                ZStack {
                    ImagePicker(image: $vm.selectedImage, showingScreenCover: $vm.showingScreenCover, showingImageCropper: $vm.showingImageCropper, imagePickerSource: vm.imagePickerSource)
                    if vm.showingImageCropper {
                        ImageCropper(imageToCrop: vm.selectedImage ?? UIImage(), croppedImage: $vm.croppedImage, showingScreenCover: $vm.showingScreenCover, showingImageCropper: $vm.showingImageCropper)
                    }
                }
                .ignoresSafeArea()
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

struct DetectorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetectorView(detectorViewModel: Container.shared.detectorViewModel())
        }
    }
}
