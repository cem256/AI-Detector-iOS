//
//  DetectViewModel.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 27.08.2023.
//

import Foundation

final class DetectorViewModel: ObservableObject {
    private let detectorService: DetectorServiceProtocol

    init(detectorService: DetectorServiceProtocol) {
        self.detectorService = detectorService
    }

    @Published var userInput: String = ""
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var detectionResult: DetectionResponse?
    @Published var showingError: Bool = false

    var isValidInput: Bool {
        if userInputLength < 250 || userInputLength > 3000 {
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
        do {
            let result = try await detectorService.detect(input: userInput)
            detectionResult = result
            /*
             } catch let networkError as NetworkError {
                 errorMessage = networkError.errorMessage
                 viewStatus = .failure
                 showingError = true
             */
        } catch {
            showingError = true
        }
        isLoading = false
    }

    func clearUserInput() {
        userInput = ""
        isLoading = false
        detectionResult = nil
    }
}
