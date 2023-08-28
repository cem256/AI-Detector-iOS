//
//  NetworkErrors.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case requestFailed(Error)
    case invalidResponse
    case invalidStatusCode(statusCode: Int)
    case dataParseError
    case unknownError

    var errorMessage: String {
        switch self {
        case .badURL:
            return "Bad URL error"
        case .requestFailed(let underlyingError):
            return "Request failed with error: \(underlyingError.localizedDescription)"
        case .invalidResponse:
            return "Invalid response error"
        case .invalidStatusCode(let statusCode):
            return "Invalid status code: \(statusCode)"
        case .dataParseError:
            return "Data parsing error"
        case .unknownError:
            return "Unknown error"
        }
    }
}
