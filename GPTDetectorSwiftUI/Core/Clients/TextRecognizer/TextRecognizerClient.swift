//
//  TextRecognizer.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 1.09.2023.
//

import Foundation
import Vision

protocol TextRecognizerProtocol {
    func recogizeText(from cgImage: CGImage) -> String
}

final class TextRecognizerClient: TextRecognizerProtocol {
    func recogizeText(from cgImage: CGImage) -> String {
        var recognizedStrings = ""
        let requestHandler = VNImageRequestHandler(cgImage: cgImage)
        let request = VNRecognizeTextRequest { request, _ in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            let recognizedArray = observations.compactMap { observation in
                observation.topCandidates(1).first?.string
            }
            recognizedStrings = recognizedArray.joined(separator: " ")
        }
        try? requestHandler.perform([request])
        return recognizedStrings
    }
}
