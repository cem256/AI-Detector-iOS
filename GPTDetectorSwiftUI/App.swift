//
//  GPTDetectorSwiftUIApp.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 27.08.2023.
//

import Factory
import SwiftUI

@main
struct GPTDetectorSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(splashViewModel: Container.shared.splashViewModel())
        }
    }
}
