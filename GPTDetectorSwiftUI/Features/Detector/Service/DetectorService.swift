//
//  DetectService.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 27.08.2023.
//

import Foundation

protocol DetectorServiceProtocol {
    func detect(input: String) async throws -> DetectionResponse
}

@MainActor
final class DetectorService: DetectorServiceProtocol {
    private let networkClient: NetworkClient = .init(baseUrl: Endpoints.baseUrl)

    func detect(input: String) async throws -> DetectionResponse {
        do {
            let requestBody = try JSONEncoder().encode(DetectionRequest(document: input))
            let data = try await networkClient.request(path: Endpoints.detect, method: .post,requestBody: requestBody)
            let response: DetectionResponse = try JSONDecoder().decode(DetectionResponse.self, from: data)
            return response
        } catch {
            throw URLError(.badServerResponse)
        }
    }
}
