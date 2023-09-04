//
//  DetectService.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 27.08.2023.
//

import Foundation

protocol DetectorServiceProtocol {
    func detect(input: String) async throws -> DetectionResponse
    func isSupportedLanguage(input: String) -> Bool
}

final class DetectorService: DetectorServiceProtocol {
    private let networkClient: NetworkClientProtocol
    private let languageIdentifierClient: LanguageIdentifierProtocol
    private let supportedLanguages: [String] = ["en"]

    init(networkClient: NetworkClientProtocol, languageIdentifierClient: LanguageIdentifierProtocol) {
        self.networkClient = networkClient
        self.languageIdentifierClient = languageIdentifierClient
    }

    func detect(input: String) async throws -> DetectionResponse {
        do {
            let requestBody = try JSONEncoder().encode(DetectionRequest(document: input))
            let data = try await networkClient.request(path: Env.detect, method: .post, queryParameters: nil, requestBody: requestBody)
            guard let response = try? JSONDecoder().decode(DetectionResponse.self, from: data) else {
                throw AppError.networkError
            }
            return response
        } catch {
            throw AppError.unknownError
        }
    }

    func isSupportedLanguage(input: String) -> Bool {
        guard let detectedLanguage = languageIdentifierClient.detectLanguage(from: input) else { return false }
        return supportedLanguages.contains(detectedLanguage)
    }
}
