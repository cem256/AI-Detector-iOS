//
//  HeaderView.swift
//  GPTDetectorSwiftUI
//
//  Created by cem on 28.08.2023.
//

import SwiftUI

struct HeaderView: View {
    @Binding var showingInfoSheet: Bool

    var body: some View {
        HStack {
            Spacer()
            Text("GPT Detector")
                .font(.title)
                .fontWeight(.medium)

            Spacer()
            Button {
                showingInfoSheet = true
            } label: {
                Image(systemName: "info.circle")
                    .font(.title2)
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(showingInfoSheet: .constant(true))
    }
}
