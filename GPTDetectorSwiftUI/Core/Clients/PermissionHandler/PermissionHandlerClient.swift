//
//  PermissionHandlerClient.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 3.09.2023.
//

import AVFoundation
import UIKit

protocol PermissionHandlerProtocol {
    var hasCameraPermission: Bool { get }
    var hasCameraPermissionDenied: Bool { get }
    func requestCameraPermission() async
    static func openAppSettings()
}

final class PermissionHandlerClient: PermissionHandlerProtocol {
    var hasCameraPermission: Bool {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        return status == .authorized
    }

    var hasCameraPermissionDenied: Bool {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        return status == .denied
    }

    func requestCameraPermission() async {
        await AVCaptureDevice.requestAccess(for: .video)
    }

    static func openAppSettings() {
        if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(settingsURL)
        }
    }
}
