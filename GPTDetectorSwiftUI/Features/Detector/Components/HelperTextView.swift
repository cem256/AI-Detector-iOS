//
//  HelperTextView.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import SwiftUI

struct HelperTextView: View {
    let isValidInput: Bool
    let inputLength: Int
    private let minCharCount = 250
    private let maxCharCount = 3000

    var body: some View {
        if !isValidInput {
            let isBelowMin = inputLength < minCharCount

            HStack {
                Text(isBelowMin ? "Enter at least \(minCharCount) characters." : "Enter at most \(maxCharCount) characters.")
                Spacer()
                Text("\(inputLength)/\(isBelowMin ? minCharCount : maxCharCount)")
            }
            .font(.subheadline)
            .foregroundColor(.gray)
        }
    }
}

struct HelperTextView_Previews: PreviewProvider {
    static var previews: some View {
        HelperTextView(isValidInput: false, inputLength: 200)
    }
}
