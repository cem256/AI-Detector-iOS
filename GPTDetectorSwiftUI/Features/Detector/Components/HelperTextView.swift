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

    var body: some View {
        if !isValidInput {
            HStack {
                Text(UserInputConstants.isShortInput(inputLength: inputLength) ? "Enter at least \(UserInputConstants.minInputLength) characters." : "Enter at most \(UserInputConstants.maxInputLength) characters.")
                Spacer()
                Text("\(inputLength)/\(UserInputConstants.isShortInput(inputLength: inputLength) ? UserInputConstants.minInputLength : UserInputConstants.maxInputLength)")
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
