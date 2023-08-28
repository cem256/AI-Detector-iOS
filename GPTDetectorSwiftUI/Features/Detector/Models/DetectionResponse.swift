//
//  DetectionResponse.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 27.08.2023.
//

import Foundation

struct DetectionResponse: Decodable {
    private let averagePerplexity: Double?
    private let maxPerplexity: Double?
    private let classification: String?

    enum CodingKeys: String, CodingKey {
        case averagePerplexity = "average_perplexity"
        case maxPerplexity = "max_perplexity"
        case classification
    }

    var uAveragePerplexity: Double { unwrappedValue(averagePerplexity, default: 0) }
    var uMaxPerplexity: Double { unwrappedValue(maxPerplexity, default: 0) }
    var uClassification: Classification { Classification.fromName(classification) }

    private func unwrappedValue<T>(_ optionalValue: T?, default defaultValue: T) -> T {
        optionalValue ?? defaultValue
    }
}

enum Classification: String {
    case initial
    case ai
    case mixed
    case human

    static func fromName(_ name: String?) -> Classification {
        guard let name = name else { return .initial }

        switch name {
        case "AI":
            return .ai
        case "MIXED":
            return .mixed
        case "HUMAN":
            return .human
        default:
            return .initial
        }
    }
}
