//
//  DetectViewModel.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 27.08.2023.
//

import Foundation

protocol DetectorViewModelProtocol: ObservableObject {
    func detect() async
    func clearUserInput()
}

final class DetectorViewModel: DetectorViewModelProtocol {
    private let detectorService: DetectorServiceProtocol

    init(detectorService: DetectorServiceProtocol) {
        self.detectorService = detectorService
    }

    @Published var userInput: String = ""
    @Published private(set) var viewStatus: ViewStatus = .initial
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
        viewStatus = .loading
        do {
            let result = try await detectorService.detect(input: userInput)
            detectionResult = result
            viewStatus = .loaded
            /*
             } catch let networkError as NetworkError {
                 errorMessage = networkError.errorMessage
                 viewStatus = .failure
                 showingError = true
                  */
        } catch {
            showingError = true
        }
    }

    func clearUserInput() {
        userInput = ""
        viewStatus = .initial
        detectionResult = nil
    }
}
