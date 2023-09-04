//
//  AppError.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 4.09.2023.
//

import Foundation

enum AppError: Error {
    case networkError
    case unknownError
    case unsupportedLanguage
    case cameraPermissionDenied

    var errorTitle: String {
        switch self {
        case .networkError:
            return "Network Error"
        case .unknownError:
            return "Oops, Something Went Wrong"
        case .unsupportedLanguage:
            return "Unsupported Language"
        case .cameraPermissionDenied:
            return "Camera Permission Required"
        }
    }

    var errorDescription: String {
        switch self {
        case .networkError:
            return "Looks like we're having trouble connecting to the server."
        case .unknownError:
            return "Don't worry, it's not your fault. Our team is on it."
        case .unsupportedLanguage:
            return "Please input text in English. Using other languages may result in inaccurate results."
        case .cameraPermissionDenied:
            return "Please grant camera permission to extract text using your device's camera in the settings."
        }
    }
}
