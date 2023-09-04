//
//  LanguageIdentifier.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 4.09.2023.
//

import NaturalLanguage

protocol LanguageIdentifierProtocol {
    func detectLanguage(from: String) -> String?
}

final class LanguageIdentifierClient: LanguageIdentifierProtocol {
    private let languageRecognizer: NLLanguageRecognizer

    init() {
        self.languageRecognizer = NLLanguageRecognizer()
    }

    func detectLanguage(from text: String) -> String? {
        languageRecognizer.processString(text)
        guard let languageCode = languageRecognizer.dominantLanguage?.rawValue else { return nil }
        return languageCode
    }
}
