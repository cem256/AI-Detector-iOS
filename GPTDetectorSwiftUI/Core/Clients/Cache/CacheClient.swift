//
//  CacheClient.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 27.08.2023.
//

import SwiftUI

enum CacheKeys: String {
    case onboarding = "isOnboardingCompleted"
}

protocol CacheClientProtocol {
    func save<T: Encodable>(for key: CacheKeys, item: T)
    func get<T: Decodable>(for key: CacheKeys) -> T?
}

final class CacheClient: CacheClientProtocol {
    func save<T: Encodable>(for key: CacheKeys, item: T) {
        guard let encoded = try? JSONEncoder().encode(item) else { return }
        UserDefaults.standard.set(encoded, forKey: key.rawValue)
    }

    func get<T: Decodable>(for key: CacheKeys) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key.rawValue) else { return nil }
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else { return nil }
        return decodedData
    }
}
