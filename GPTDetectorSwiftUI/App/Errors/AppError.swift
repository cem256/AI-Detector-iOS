//
//  AppError.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 4.09.2023.
//

import Foundation
import SwiftUI

enum AppError: Error {
    case networkError
    case unknownError
    case unsupportedLanguage
    case cameraPermissionDenied

    var errorTitle: String {
        switch self {
        case .networkError:
            return "APP_ERROR_NETWORK_TITLE"
        case .unknownError:
            return "APP_ERROR_UNKNOWN_TITLE"
        case .unsupportedLanguage:
            return "APP_ERROR_UNSUPPORTED_LANGUAGE_TITLE"
        case .cameraPermissionDenied:
            return "APP_ERROR_CAMERA_PERMISSION_TITLE"
        }
    }

    var errorDescription: String {
        switch self {
        case .networkError:
            return "APP_ERROR_NETWORK_DESCRIPTION"
        case .unknownError:
            return "APP_ERROR_UNKNOWN_DESCRIPTION"
        case .unsupportedLanguage:
            return "APP_ERROR_UNSUPPORTED_LANGUAGE_DESCRIPTION"
        case .cameraPermissionDenied:
            return "APP_ERROR_CAMERA_PERMISSION_DESCRIPTION"
        }
    }
}
