//
//  ViewExtensions.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 30.08.2023.
//

import SwiftUI

extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
