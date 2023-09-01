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

final class DetectorService: DetectorServiceProtocol {
    private let networkClient: NetworkClientProtocol

    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }

    func detect(input: String) async throws -> DetectionResponse {
        do {
            let requestBody = try JSONEncoder().encode(DetectionRequest(document: input))
            let data = try await networkClient.request(path: Env.detect, method: .post, queryParameters: nil, requestBody: requestBody)
            guard let response = try? JSONDecoder().decode(DetectionResponse.self, from: data) else {
                throw NetworkError.dataParseError
            }
            return response
        } catch {
            throw NetworkError.unknownError
        }
    }
}
