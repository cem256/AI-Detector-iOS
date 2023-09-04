//
//  DetectViewModel.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 27.08.2023.
//

import Foundation
import SwiftUI

final class DetectorViewModel: ObservableObject {
    private let detectorService: DetectorServiceProtocol
    private let permissionHandlerClient: PermissionHandlerProtocol
    private let textRecognizerClient: TextRecognizerProtocol

    init(detectorService: DetectorServiceProtocol, permissionHandlerClient: PermissionHandlerProtocol, textRecognizerClient: TextRecognizerProtocol) {
        self.detectorService = detectorService
        self.permissionHandlerClient = permissionHandlerClient
        self.textRecognizerClient = textRecognizerClient
    }

    @Published var userInput: String = ""
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var detectionResult: DetectionResponse?

    @Published var showingError: Bool = false
    @Published private(set) var errorType: AppError?

    @Published var selectedImage: UIImage? = nil
    @Published private(set) var imagePickerSource: UIImagePickerController.SourceType = .photoLibrary
    @Published var croppedImage: UIImage = .init()

    @Published var showingScreenCover: Bool = false
    @Published var showingImageCropper: Bool = false

    var isValidInput: Bool {
        if userInputLength < UserInputConstants.minInputLength || userInputLength > UserInputConstants.maxInputLength {
            return false
        }
        return true
    }

    var userInputLength: Int {
        formatUserInput().count
    }

    private func formatUserInput() -> String {
        userInput.trimmingCharacters(in: .whitespacesAndNewlines).description
    }

    @MainActor
    func detect() async {
        isLoading = true
        if !detectorService.isSupportedLanguage(input: userInput) {
            errorType = .unsupportedLanguage
            showingError = true
        }
        do {
            let result = try await detectorService.detect(input: userInput)
            detectionResult = result
        }
        catch let error as AppError {
            errorType = error
            showingError = true
        }
        catch {
            errorType = .unknownError
            showingError = true
        }

        isLoading = false
    }

    func onClearButtonTapped() {
        userInput = ""
        isLoading = false
        detectionResult = nil
    }

    func onPhotoLibraryButtonTapped() {
        imagePickerSource = .photoLibrary
        showingScreenCover = true
    }

    @MainActor
    func onCameraButtonTapped() async {
        imagePickerSource = .camera
        if !permissionHandlerClient.hasCameraPermission && permissionHandlerClient.hasCameraPermissionDenied {
            errorType = .cameraPermissionDenied
            showingError = true
        }
        else if !permissionHandlerClient.hasCameraPermission {
            await permissionHandlerClient.requestCameraPermission()
            if permissionHandlerClient.hasCameraPermission {
                showingScreenCover = true
            }
        }
        else {
            showingScreenCover = true
        }
    }

    func performOcrFromImage() {
        guard let cgImage = croppedImage.cgImage else { return }
        userInput = textRecognizerClient.recogizeText(from: cgImage)
    }
}
