//
//  NetworkClient.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 27.08.2023.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol NetworkClientProtocol {
    func request(path: String, method: HTTPMethod, queryParameters: [URLQueryItem]?, requestBody: Data?) async throws -> Data
}

@MainActor
final class NetworkClient: NetworkClientProtocol {
    private let baseUrl: String
    private let bearer: String

    init(baseUrl: String, bearer: String) {
        self.baseUrl = baseUrl
        self.bearer = bearer
    }

    func request(path: String, method: HTTPMethod, queryParameters: [URLQueryItem]? = nil, requestBody: Data? = nil) async throws -> Data {
        var urlComponents = URLComponents(string: baseUrl + path)
        urlComponents?.queryItems = queryParameters

        guard let url = urlComponents?.url else { throw NetworkError.badURL }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        if let requestBody = requestBody {
            request.httpBody = requestBody
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        request.setValue(Env.bearer, forHTTPHeaderField: "Authorization")

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }

            if httpResponse.statusCode != 200 {
                throw NetworkError.invalidStatusCode(statusCode: httpResponse.statusCode)
            }

            return data
        } catch {
            throw NetworkError.unknownError
        }
    }
}
